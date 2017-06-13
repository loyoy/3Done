# 3Done

## 说明
### 需要在合作伙伴APP中设置如下：
### 在软件中实现如下步骤：
### 1、取到模型对应的地址。
### 2、在呼出UP Studio的控制器中遵守 UIDocumentInteractionControllerDelegate
### 3、创建UIDocumentInteractionController 对象，并设置URL 为文件路径
### 4、设置代理为当前控制器。
### 5、设置UIDocumentInteractionController的UTI，如果是.stl，则设置为com.sunsetlakesoftware.molecules.stl  如果为其他格式，请提前告知。
### 6、设置弹出的选择框样式儿。
