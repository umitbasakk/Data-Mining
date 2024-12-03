import os
import shutil
from sklearn.model_selection import train_test_split

# Ana veri yolu
dataset_path = r"C:\Notlarim\PROJELER\FOOD_PROJECT\FOOD_DATASET"
output_path = r"C:\Notlarim\PROJELER\FOOD_PROJECT\FOOD_SPLIT"

# Resim ve etiket dosyalarını toplamak için listeler
images = []
labels = []

# Alt klasörlerdeki tüm dosyaları taramak için os.walk kullan
for root, _, files in os.walk(dataset_path):
    for file in files:
        if file.endswith(('.jpg', '.png', '.jpeg', '.webp')):  # webp eklendi
            images.append(os.path.join(root, file))
        elif file.endswith('.txt'):
            labels.append(os.path.join(root, file))

# Her resimle aynı ada sahip etiket dosyalarını eşleştir
matched_data = [(img, img.replace('.jpg', '.txt').replace('.png', '.txt')
                 .replace('.jpeg', '.txt').replace('.webp', '.txt'))
                for img in images if img.replace('.jpg', '.txt').replace('.png', '.txt')
                .replace('.jpeg', '.txt').replace('.webp', '.txt') in labels]

# Eğitim ve test verilerini ayır
train_data, test_data = train_test_split(matched_data, test_size=0.2, random_state=42)

# Verileri hedef klasöre kopyalama fonksiyonu
def copy_files(data, subset):
    img_output_dir = os.path.join(output_path, subset, 'images')
    label_output_dir = os.path.join(output_path, subset, 'labels')
    os.makedirs(img_output_dir, exist_ok=True)
    os.makedirs(label_output_dir, exist_ok=True)

    for img_file, label_file in data:
        shutil.copy(img_file, img_output_dir)
        shutil.copy(label_file, label_output_dir)

# Verileri kopyala
copy_files(train_data, 'train')
copy_files(test_data, 'test')

print("Veri ayırma işlemi tamamlandı!")
