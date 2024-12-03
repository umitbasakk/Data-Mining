# DATA MANIPULATION
import torch
print(torch.cuda.is_available())  # True döndürmelidir
import sympy
print(sympy.__file__)
import sys
print(sys.path)

# Etiketlerin bulunduğu klasör yolu
import os
os.environ["KMP_DUPLICATE_LIB_OK"] = "TRUE"

# Etiketlerin bulunduğu ana klasör yolu
labels_folder = r"C:\FOOD_DATASET\AnaYemeklerIsaretlenmis"

# Sınıf etiketlerini belirlemek için sayaç başlat
class_id = 71

# Klasördeki tüm alt klasörleri ve dosyaları gez
for root, dirs, files in os.walk(labels_folder):
    print(f"Root: {root}")  # Geçerli klasörü yazdır
    for label_file in files:
        # Sadece .txt dosyalarını işleyelim
        if label_file.endswith('.txt'):
            label_path = os.path.join(root, label_file)
            print(f"Processing file: {label_path}")  # İşlemeye başlanan dosyayı yazdır
            
            with open(label_path, 'r') as file:
                lines = file.readlines()

            # İçeriği düzenleyelim
            updated_lines = []
            for line in lines:
                parts = line.strip().split()
                parts[0] = str(class_id)  # Her dosya için mevcut class_id'yi kullan
                updated_lines.append(" ".join(parts))

            # Dosyayı tekrar yazalım
            with open(label_path, 'w') as file:
                file.write("\n".join(updated_lines))
            
            print(f"Updated: {label_path} with class_id: {class_id}")
            
            # Sınıf etiketini artır
    class_id += 1


#CLASSES SILME
# Ana klasör yolu
folder_path = r"C:\FOOD_DATASET\CorbalarIsaretlenmis"

try:
    # Ana klasördeki tüm alt klasörleri ve dosyaları tarar
    for root, dirs, files in os.walk(folder_path):
        for file_name in files:
            # Eğer dosya adı 'classes.txt' ise
            if file_name == "classes.txt":
                file_path = os.path.join(root, file_name)  # Dosyanın tam yolu
                os.remove(file_path)  # Dosyayı sil
                print(f"Silindi: {file_path}")  # Bilgi çıktısı

    print("Tüm 'classes.txt' dosyaları başarıyla silindi.")
except Exception as e:
    print(f"Hata oluştu: {e}")


#DOSYALARI TURKCE KARAKTERDEN ARINDIR
# Klasör yolu
folder_path = r"C:\Users\OĞUZ METE\Desktop\AnaYemeklerIsaretlenmis"

# Türkçe karakterleri ve boşlukları kaldırmak için dönüşüm tablosu
transformation_table = str.maketrans(
    "ÇçĞğİıÖöŞşÜü ",
    "CcGgIiOoSsUu_"
)

# Dosya isimlerini listeleme ve değiştirme
try:
    file_names = os.listdir(folder_path)
    
    for original_name in file_names:
        # Yeni isim: Türkçe karakterler ve boşluklar temizlenmiş hali
        cleaned_name = original_name.translate(transformation_table)
        original_path = os.path.join(folder_path, original_name)
        cleaned_path = os.path.join(folder_path, cleaned_name)
        
        # Eğer isim değişikliği gerekiyorsa dosyayı yeniden adlandır
        if original_name != cleaned_name:
            os.rename(original_path, cleaned_path)
            print(f"{original_name} -> {cleaned_name}")
    
    print("Dosya isimleri başarıyla değiştirildi.")
except Exception as e:
    print(f"Hata oluştu: {e}")



classes = pd.read_csv('classes.txt')
