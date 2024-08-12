import os.path
import torchvision.models as models
import torch
from loaddata import load_data


class TrainCONV:
    def __init__(self, img_dir="./dataset", epoch=100, batch_size=256, learing_rate=0.001):
        super().__init__()
        print("准备训练....")

        # 保存模型的位置
        self.model_file = "herbal_classifier.mod"

        # GPU是否可用 TRUE or FALSE
        self.CUDA=torch.cuda.is_available()
        # self.CUDA = False

        # 数据集
        self.tr, self.ts, self.cls_idx = load_data(img_dir, batch_size=batch_size)

        # 初始化模型结构
        self.net =models.convnext_base()

        # 获取最后一个全连接层的输入特征数
        fc_in = self.net.classifier[-1].in_features

        # 修改最后一个全连接层，使其输出15个类别
        self.net.classifier[-1] = torch.nn.Linear(fc_in, 15)

        if self.CUDA:
            self.net.cuda()  # cpu==>gpu

        if os.path.exists(self.model_file):
            print("加载本地模型，继续训练")
            state_dict = torch.load(self.model_file)
            self.net.load_state_dict(state_dict)
        else:
            print("从头训练")

        self.lr = learing_rate
        self.epoch = epoch
        self.opt = torch.optim.Adam(self.net.parameters(), lr=self.lr)
        self.loss_function = torch.nn.CrossEntropyLoss()
        if self.CUDA:
            self.loss_function = self.loss_function.cuda()

    def train(self):
        print('开始训练')
        for e in range(self.epoch):
            self.net.train()
            for samples, labels in self.tr:
                self.opt.zero_grad()
                if self.CUDA:
                    samples = samples.cuda()
                    labels = labels.cuda()
                y = self.net(samples.view(-1, 3, 224, 224))
                loss = self.loss_function(y, labels)
                loss.backward()
                self.opt.step()
            # 测试
            c_rate = self.validate()
            print(F"轮数：{e},准确率：{c_rate}")
            # 保存模型
            torch.save(self.net.state_dict(), self.model_file)

    @torch.no_grad()
    def validate(self):
        num_samples = 0
        num_correct = 0
        for samples, labels in self.ts:
            if self.CUDA:
                samples = samples.cuda()
                labels = labels.cuda()
            num_samples += len(samples)
            # 调整数据大小，然后将数据放进网络，得出结果
            out = self.net(samples.view(-1, 3, 224, 224))
            # 概率最大的
            out = torch.nn.functional.softmax(out, dim=1)
            # 得到下标
            y = torch.argmax(out, dim=1)
            num_correct += (y == labels).float().sum()
        return num_correct * 100 / num_samples


t = TrainCONV(epoch=50)
t.train()
