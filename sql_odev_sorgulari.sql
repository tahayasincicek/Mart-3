-- SQL Komutları Araştırma Ödevi
-- A) ALTER TABLE Kullanımı
-- Bir tabloya yeni sütun nasıl eklenir? Bir tabloya yeni bir sütun eklemek için ALTER TABLE komutu kullanılır. Bu işlem, mevcut tabloya yeni bir bilgi eklememizi sağlar.
ALTER TABLE kitaplar ADD yayinevi VARCHAR(100);
-- Bir sütun nasıl değiştirilir? Bir sütunun veri tipi veya diğer özellikleri değiştirilebilir.
ALTER TABLE kitaplar MODIFY yayinevi TEXT;
-- B) UPDATE, DELETE Kullanımı
-- UPDATE komutu kullanımı: Bu komut, tabloda var olan kayıtları güncellemek için kullanılır.
UPDATE kitaplar SET fiyat = 50 WHERE id = 1;
-- DELETE komutu kullanımı: Belirli bir koşulu sağlayan kayıtları silmek için kullanılır.
DELETE FROM kitaplar WHERE id = 1;
-- C) INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN Farkları
-- JOIN işlemleri, birden fazla tabloyu ilişkilendirmek için kullanılır. Farklı türleri şunlardır:
-- INNER JOIN: İki tabloda da eşleşen kayıtları getirir.
-- LEFT JOIN: Sol tablodaki tüm kayıtları ve sağ tablodaki eşleşenleri getirir.
-- RIGHT JOIN: Sağ tablodaki tüm kayıtları ve sol tablodaki eşleşenleri getirir.
-- FULL JOIN: Her iki tablodaki tüm kayıtları döndürür.
-- INNER JOIN (Eşleşen kayıtları getirir)
SELECT * FROM kitaplar INNER JOIN yazarlar ON kitaplar.yazar_id = yazarlar.id;

-- LEFT JOIN (Sol tablodaki tüm kayıtları, sağdan eşleşenleri getirir)
SELECT * FROM kitaplar LEFT JOIN yazarlar ON kitaplar.yazar_id = yazarlar.id;

-- RIGHT JOIN (Sağ tablodaki tüm kayıtları, soldan eşleşenleri getirir)
SELECT * FROM kitaplar RIGHT JOIN yazarlar ON kitaplar.yazar_id = yazarlar.id;

-- FULL JOIN (Her iki tablodaki tüm kayıtları getirir)
SELECT * FROM kitaplar FULL JOIN yazarlar ON kitaplar.yazar_id = yazarlar.id;
-- D) HAVING ve GROUP BY Birlikte Kullanımı
-- GROUP BY, verileri belirli bir sütuna göre gruplamak için kullanılır. HAVING, gruplandırılmış sonuçlar üzerinde koşul eklemeye yarar.
SELECT yazar_id, COUNT(*) AS kitap_sayisi FROM kitaplar 
GROUP BY yazar_id HAVING COUNT(*) > 5;
-- E) TOP, OFFSET-FETCH Kullanarak Sıralı Veri Çekme
-- Veri sıralaması yaparak belirli miktarda veri çekmek için kullanılır.
-- İlk 5 kitabı getir (SQL Server)
SELECT TOP 5 * FROM kitaplar ORDER BY yayin_tarihi DESC;

-- İlk 5 kitabı getir (MySQL/PostgreSQL)
SELECT * FROM kitaplar ORDER BY yayin_tarihi DESC LIMIT 5;

-- 5. sıradan sonraki 5 kitabı getir
SELECT * FROM kitaplar ORDER BY yayin_tarihi DESC OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
-- F) SUBQUERY Kullanımı
-- Alt sorgular, ana sorgunun içinde çalıştırılan iç sorgulardır.
SELECT * FROM kitaplar WHERE yazar_id IN (SELECT id FROM yazarlar WHERE ulke = 'Türkiye');
-- G) AND / OR Mantıksal Operatörleri
-- Bu operatörler, koşullu sorgularda kullanılır.
SELECT * FROM kitaplar WHERE fiyat > 50 AND yayin_tarihi > '2020-01-01';
SELECT * FROM kitaplar WHERE fiyat > 50 OR yayin_tarihi > '2020-01-01';
-- H) BETWEEN ile Aralık Filtrelemesi
-- Belirtilen aralıktaki verileri getirir.
SELECT * FROM kitaplar WHERE yayin_tarihi BETWEEN '2020-01-01' AND '2023-12-31';
-- I) IN ile Çoklu Değer Karşılaştırması
-- Birden fazla değeri sorgulamak için kullanılır.
SELECT * FROM kitaplar WHERE kategori IN ('Roman', 'Bilimkurgu', 'Tarih');
-- J) LIKE Operatörü ve Joker Karakterler
-- LIKE operatörü, belirli bir desene uyan verileri getirmek için kullanılır:
-- 'Harry' ile başlayan kitapları getir
SELECT * FROM kitaplar WHERE isim LIKE 'Harry%';

-- 'Potter' ile biten kitapları getir
SELECT * FROM kitaplar WHERE isim LIKE '%Potter';

-- İçinde 'büyü' geçen kitapları getir
SELECT * FROM kitaplar WHERE isim LIKE '%büyü%';

-- İkinci harfi 'a' olan kitapları getir
SELECT * FROM kitaplar WHERE isim LIKE '_a%';
