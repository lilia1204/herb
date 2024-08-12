import torch
import torchvision.models as models


class TcmRecognizer:
    def __init__(self, module_file='./herbal_classifier.mod'):
        super(TcmRecognizer, self).__init__()
        self.module_file = module_file
        self.CUDA = torch.cuda.is_available()
        self.net = models.convnext_base()

        fc_in = self.net.classifier[-1].in_features
        self.net.classifier[-1] = torch.nn.Linear(fc_in, 15)


        if self.CUDA:
            self.net.cuda()
            device = 'cuda'
        else:
            device = 'cpu'

        state = torch.load(self.module_file, map_location=device)
        self.net.load_state_dict(state)
        print("模型加载完毕！")
        self.net.eval()

    @torch.no_grad()
    def recognize(self, img):
        with torch.no_grad():
            if self.CUDA:
                img = img.cuda()
            img = img.view(-1, 3, 224, 224)
            y = self.net(img)
            y = torch.nn.functional.softmax(y, dim=1)
            p, cls_idx = torch.max(y, dim=1)
            return p.cpu(), cls_idx.cpu()






