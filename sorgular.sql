-- Books tablosundaki tüm kitapları listeleyen sorguyu yazınız.
SELECT * FROM Books;
-- Yalnızca "Bilgisayar Bilimleri" kategorisindeki kitapları listeleyiniz
SELECT * FROM Books WHERE catogory="Bilgisayar Bilimleri";
-- 2020 ve sonrasında yayımlanan kitapları listeleyiniz.
SELECT * FROM Books WHERE published>=2020;
-- Her kitabın ismini ve ait olduğu kategoriyi listeleyen sorguyu yazınız.
SELECT name_,catogory FROM Books;
-- Kitap alan öğrencilerin adını, soyadını ve kitap adını listeleyiniz.
SELECT user.name_ user.lastname book._name FROM Shared
Join user On Shared.id=user.id
Join book On Shared.id=book.id;
-- Her kitapla ilişkili yazarı ve yayın yılını listeleyiniz.
SELECT Book.name_,Autor.name_,Book.published FROM Book
Join Autor on Autor.id=book.id;
-- Hangi kullanıcı hangi kitabı ne zaman almış? 
SELECT Book.name_,user.name_,Shared.date FROM Shared
Join book on Book.id=Shared.id
Join user on user.id=Shared.id
-- Geri dönüş tarihi boş olan kitapların listesini ve kullanıcı bilgilerini getiriniz.
SELECT Book.name_,user.name_,Shared.date FROM Shared
Join book on Book.id=Shared.id
Join user on user.id=Shared.id
WHERE Shared.returndate is null
-- Her kategoriye ait kaç kitap olduğunu listeleyiniz.
SELECT catogory,count(*) FROM book group by catogory
-- En çok kitap ödünç alan kullanıcıları en fazla borç alandan az borç alana göre sıralayınız
SELECT User.FullName, COUNT(*) 
FROM Shared
INNER JOIN User ON Shared.ID = User.ID
GROUP BY User.FullName
ORDER BY count(*) DESC;

