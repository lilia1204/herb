from torchvision.datasets import ImageFolder
from torchvision import transforms
from torch.utils.data import random_split, DataLoader


def load_data(img_dir, train_rate=0.8, batch_size=128):
    transform = transforms.Compose([
        transforms.Resize(256),
        transforms.CenterCrop(224),
        transforms.ToTensor(),
        transforms.Normalize(mean=[0.5396, 0.5315, 0.3891], std=[0.2747, 0.2715, 0.2975])
    ])
    # (数据集路径，数据集预处理)
    ds = ImageFolder(img_dir, transform=transform)
    # print("类名到索引的映射:", ds.class_to_idx)
    # print(len(ds))
    # print(ds.classes)

    # 手动切分训练集和测试集
    l = len(ds)
    num_train = int(l * train_rate)
    train, test = random_split(ds, [num_train, l - num_train])
    # dataloader
    train_loader = DataLoader(dataset=train, shuffle=True, batch_size=batch_size)
    test_loader = DataLoader(dataset=test, shuffle=True, batch_size=batch_size)
    return train_loader, test_loader, ds.classes


