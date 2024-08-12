import os, sys, cv2
from AI.TCMRecognizer import TcmRecognizer
from torchvision.transforms import Resize, Compose, ToTensor, Normalize, CenterCrop
from PIL import Image


class classify:
    def __init__(self, module_file='./herbal_classifier.mod'):
        self.t = TcmRecognizer(module_file=module_file)
        self.transform = Compose([
            Resize(256),
            CenterCrop(224),
            ToTensor(),
            Normalize(mean=[0.5396, 0.5315, 0.3891], std=[0.2747, 0.2715, 0.2975])
        ])

        # 将分类器输出的类别索引映射到具体的药材名称
        self.classes = {
            0: '艾叶',
            1: '苍耳子',
            2: '车前草',
            3: '陈皮',
            4: '当归',
            5: '冬虫夏草',
            6: '干枸杞',
            7: '桂花',
            8: '罗汉果',
            9: '金银花',
            10: '九层塔',
            11: '芦荟',
            12: '罗汉果',
            13: '柿蒂',
            14: '无花果'
        }

    def TCMclassify(self, image):

        img = Image.open(image)
        img = img.convert('RGB')
        img = self.transform(img)
        p, cls = self.t.recognize(img)
        cls = cls.numpy()[0]
        p = p.numpy()[0]
        class_name = self.classes[cls]

        return class_name, p
