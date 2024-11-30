#Veri Ön İşlemesi
import numpy as np
import pandas as pd
import re

df = pd.read_excel("food_list.xls")

df.head()

df.columns = ["Pazartesi", "Sali", "Carsamba", "Persembe", "Cuma", "Cumartesi", "Pazar"]

df = df.drop([0, 1, 10, 19, 28, 37], axis=0) #Tarihleri silme

new_index = []

for i in range(1, 41): 
    new_index.extend([f"Corba{i}", f"Ana Yemek{i}", f"Ana Yemek{i}", f"Yardımcı Yemek{i}", f"Aparatif{i}", f"Aparatif{i}", f"Aparatif{i}",  f"Aparatif{i}"])

new_index = new_index[:len(df)] 

df.index = new_index

#%%
#Çorba
corba_list = [df.loc[df.index == f"Corba{i}"] for i in range(1,6)]
corba = pd.concat(corba_list,axis = 0)
parcalar = []
for i in range(len(corba)):
    for j in range(len(corba.columns)):
        if pd.isna(corba.iloc[i,j]):
            continue
        parca = corba.iloc[i,j].split("-") 
        parcalar.extend(parca)

corbalar = []
for eleman in parcalar:
    if '(' in eleman:
        kcal_sayisi = len(re.findall(r'KCAL', eleman))
        if kcal_sayisi >1:
            continue
        isim, kalori = eleman.split("(")
        if ('KCAL)') in kalori:
            kalori = kalori.replace("KCAL)","").strip()
        else:
            continue
        corbalar.append({"Corba": isim.strip(), "Kalori": int(kalori)})  
        
            
corbalar = pd.DataFrame(corbalar)
corbalar = corbalar.drop_duplicates().reset_index(drop=True)
corbalar.to_csv("corbalar.txt",sep="\t",index = False)
#%%
#Ana Yemek
ana_yemek_list = [df.loc[df.index == f"Ana Yemek{i}"] for i in range(1,6)]
ana_yemek = pd.concat(ana_yemek_list, axis = 0)

parcalar = []

for i in range(len(ana_yemek)):
    for j in range(len(ana_yemek.columns)):
        if pd.isna(ana_yemek.iloc[i,j]):
            continue
        parca = ana_yemek.iloc[i,j].split("-") 
        parcalar.extend(parca)
        
parcalar = pd.DataFrame(parcalar) 
parcalar = parcalar.drop_duplicates().reset_index(drop=True)#Elle duzeltilmesi gereken 1 satir var
parcalar = parcalar[0].tolist() 

ana_yemekler = []

for eleman in parcalar:
    if '(' in eleman:
        kcal_sayisi = len(re.findall(r'KCAL', eleman))
        if kcal_sayisi >1:
            continue
        isim, kalori = eleman.split("(")
        if ('KCAL)') in kalori:
            kalori = kalori.replace("KCAL)","").strip()
        else:
            continue
        ana_yemekler.append({"Ana Yemek": isim.strip(), "Kalori": int(kalori)})  
        
            
ana_yemekler = pd.DataFrame(ana_yemekler)
ana_yemekler = ana_yemekler.drop_duplicates().reset_index(drop=True)
ana_yemekler.to_csv("ana_yemekler.txt",sep="\t",index = False)

#%%
#Aparatif
aparatif_list = [df.loc[df.index == f"Aparatif{i}"] for i in range(1,6)]
aparatif = pd.concat(aparatif_list, axis = 0)

new_index_aparatif = []
for i in range(1, 21): 
    new_index_aparatif.extend([f"Tatli{i}", f"Salata{i}", f"Salata{i}", f"Icecek{i}"])

new_index_aparatif = new_index_aparatif[:len(aparatif)] 
aparatif.index = new_index_aparatif


parcalar = []
for i in range(len(aparatif)):
    for j in range(len(aparatif.columns)):
        if pd.isna(aparatif.iloc[i,j]):
            continue
        parca = aparatif.iloc[i,j].split("-") 
        parcalar.extend(parca)
parcalar = pd.DataFrame(parcalar) 
parcalar = parcalar.drop_duplicates().reset_index(drop=True)#Elle duzeltilmesi gereken 1 satir var
parcalar = parcalar[0].tolist() 

aparatifler = []
for eleman in parcalar:
    if '(' in eleman:
        kcal_sayisi = len(re.findall(r'KCAL', eleman))
        if kcal_sayisi >1:
            continue
        isim, kalori = eleman.split("(")
        if ('KCAL)') in kalori:
            kalori = kalori.replace("KCAL)","").strip()
        else:
            continue
        aparatifler.append({"Aparatif": isim.strip(), "Kalori": int(kalori)})  
        
            
aparatifler = pd.DataFrame(aparatifler)
aparatifler = aparatifler.drop_duplicates().reset_index(drop=True)
aparatifler.to_csv("aparatifler.txt",sep="\t",index = False)



#%%Klasorleri olusturma
import os

def isim_duzenle(isim):
    return isim.replace(" ","_")

def turkce_karakter(isim):
    turkce_karakterler = {'ç': 'c', 'Ç': 'C', 'ğ': 'g', 'Ğ': 'G', 'ı': 'i', 'İ': 'I', 'ö': 'o', 'Ö': 'O', 'ş': 's', 'Ş': 'S', 'ü': 'u', 'Ü': 'U'}
    for karakter, degisim in turkce_karakterler.items():
        isim = isim.replace(karakter, degisim)
    return isim

#corba

ana_klasor = 'corbalar'
os.makedirs(ana_klasor, exist_ok=True)

corbalar.iloc[:,0]

isimler = corbalar.iloc[:, 0].apply(isim_duzenle)
isimler = isimler.apply(turkce_karakter)
# Her isim için bir klasör oluştur
for isim in isimler:
    alt_klasor = os.path.join(ana_klasor, isim)
    os.makedirs(alt_klasor, exist_ok=True)
    print(f"{isim} klasörü oluşturuldu.")
    

ana_klasor = 'ana_yemekler'
os.makedirs(ana_klasor, exist_ok=True)

#ana yemek

ana_yemekler.iloc[:,0]

isimler = ana_yemekler.iloc[:, 0].apply(isim_duzenle)
isimler = isimler.apply(turkce_karakter)

# Her isim için bir klasör oluştur
for isim in isimler:
    alt_klasor = os.path.join(ana_klasor, isim)
    os.makedirs(alt_klasor, exist_ok=True)
    print(f"{isim} klasörü oluşturuldu.")
    

#aparatifler

ana_klasor = 'aparatifler'
os.makedirs(ana_klasor, exist_ok=True)


aparatifler.iloc[:,0]

isimler = aparatifler.iloc[:, 0].apply(isim_duzenle)
isimler = isimler.apply(turkce_karakter)

# Her isim için bir klasör oluştur
for isim in isimler:
    alt_klasor = os.path.join(ana_klasor, isim)
    os.makedirs(alt_klasor, exist_ok=True)
    print(f"{isim} klasörü oluşturuldu.")
    
