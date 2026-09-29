## Berapa total keseluruhan streams yang dihasilkan oleh seluruh artis di dalam dataset?

SELECT Artist_Name, Primary_Genre, Total_Streams,
FROM `round-legacy-504013-a5.dataset_sesi_3.Spotify`
GROUP BY Primary_Genre, Artist_Name, Total_Streams
ORDER BY Total_Streams DESC;

## MELIHAT GENERASI POP YANG DEBUT DIATAS TAHUN 2015

SELECT Artist_Name, Debut_Year,
FROM `round-legacy-504013-a5.dataset_sesi_3.Spotify`
WHERE Primary_Genre = 'Pop' AND Debut_Year >= 2015
GROUP BY Primary_Genre, Artist_Name, Debut_Year
ORDER BY Debut_Year DESC;


### MENCARI RANK 1 ARTIST DI SETIAP REGION

SELECT 
Country_of_Origin,
Artist_Name,
Total_Streams,
FROM `round-legacy-504013-a5.dataset_sesi_3.Spotify`
WHERE 1=1
QUALIFY ROW_NUMBER() OVER (PARTITION BY Country_of_Origin ORDER BY Total_Streams DESC) = 1
ORDER BY Total_Streams DESC


## TOP 10 BY TOTAL STREAMS

SELECT Artist_Name,Primary_Genre,Total_Streams
FROM `round-legacy-504013-a5.dataset_sesi_3.Spotify` 
ORDER BY Total_Streams DESC
LIMIT 10


## Hitung total streams dan jumlah artis untuk setiap Primary_Genre, lalu urutkan dari genre dengan total streams terbanyak.
SELECT Primary_Genre,COUNT(Artist_Name) as total_artis, ROUND(SUM(Total_Streams)) AS total_stream
FROM `round-legacy-504013-a5.dataset_sesi_3.Spotify` 
GROUP BY Primary_Genre
ORDER BY total_stream DESC


## Tampilkan genre yang memiliki rata-rata Total_Streams di atas 50.000

SELECT 
    Primary_Genre, 
    ROUND(AVG(Total_Streams)) AS avg_stream
FROM `round-legacy-504013-a5.dataset_sesi_3.Spotify`
GROUP BY Primary_Genre
HAVING avg_stream > 15000
ORDER BY avg_stream DESC;

### Buat kolom baru bernama Status_Debut yang mengategorikan artis menjadi 'Senior' (debut sebelum 2015) dan 'Baru' (debut 2015 ke atas).

SELECT  Artist_Name, 
        Debut_Year,
        CASE 
        WHEN Debut_Year >= 2015 THEN 'Junior'
        WHEN Debut_Year < 2015 THEN 'Senior'
        END AS Status_Debut
FROM `round-legacy-504013-a5.dataset_sesi_3.Spotify`















































