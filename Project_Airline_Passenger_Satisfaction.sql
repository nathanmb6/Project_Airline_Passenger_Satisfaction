USE airline_passenger_satisfaction;

-- Mengubah Tipe data pada Table review1
ALTER TABLE review1
    ADD PRIMARY KEY `Pr_index`(`index`),
    MODIFY `id` VARCHAR(6) NOT NULL,
    ADD CONSTRAINT `id_unique` UNIQUE(`id`),
    MODIFY `Gender` ENUM('Female','Male') NOT NULL,
    MODIFY `Age` VARCHAR(2) NOT NULL,
    MODIFY `Customer Type` ENUM(
        'disloyal Customer','Loyal Customer'
        ) NOT NULL,
    MODIFY `Type of Travel` ENUM(
        'Business travel',
        'Personal Travel') NOT NULL,
    MODIFY `Class` ENUM('Eco','Eco Plus','Business') NOT NULL,
    MODIFY `satisfaction` ENUM(
        'neutral or dissatisfied',
        'satisfied') NOT NULL;

-- Mengubah Tipe data pada Table review2
ALTER TABLE review2
    ADD PRIMARY KEY `Pr_index`(`index`),
    MODIFY `id` VARCHAR(6) NOT NULL,
    ADD CONSTRAINT `id_unique` UNIQUE(`id`),
    MODIFY `Gender` ENUM('Female','Male') NOT NULL,
    MODIFY `Age` VARCHAR(2) NOT NULL,
    MODIFY `Customer Type` ENUM(
        'disloyal Customer','Loyal Customer'
        ) NOT NULL,
    MODIFY `Type of Travel` ENUM(
        'Business travel',
        'Personal Travel') NOT NULL,
    MODIFY `Class` ENUM('Eco','Eco Plus','Business') NOT NULL,
    MODIFY `satisfaction` ENUM(
        'neutral or dissatisfied',
        'satisfied') NOT NULL;

ALTER TABLE review1
    MODIFY Age INT NOT NULL,
    MODIFY id INT NOT NULL;

ALTER TABLE review2
    MODIFY Age INT NOT NULL,
    MODIFY id INT NOT NULL;

-- Memeriksa Rentang Umur dari kolom Age
SELECT r1.Age AS Age_r1, r2.Age AS Age_r2
FROM review1 AS r1
JOIN review2 AS r2 
    ON r1.Age = r2.Age
ORDER BY Age_r1, Age_r2;

-- Menambahkan column baru untuk mengkategorikan berdasarkan umur
ALTER TABLE review1
    ADD COLUMN `Age_category` ENUM(
        'Children',
        'Teenagers',
        'Young Adults',
        'Middle-aged Adults',
        'Elderly'
    );

ALTER TABLE review2
    ADD COLUMN `Age_category` ENUM(
        'Children',
        'Teenagers',
        'Young Adults',
        'Middle-aged Adults',
        'Elderly'
    );

/* 
    Melakukan Pemetaan data Age ke kolom Age_category
    pada tabel review1 dan review2
*/

UPDATE review1
SET Age_category = 'Children'
WHERE AGE BETWEEN 7 AND 12;

UPDATE review1
SET Age_category = 'Teenagers'
WHERE AGE BETWEEN 13 AND 19;

UPDATE review1
SET Age_category = 'Young Adults'
WHERE AGE BETWEEN 20 AND 39;

UPDATE review1
SET Age_category = 'Middle-aged Adults'
WHERE AGE BETWEEN 40 AND 59;

UPDATE review1
SET Age_category = 'Elderly'
WHERE AGE >= 60;

UPDATE review2
SET Age_category = 'Children'
WHERE AGE BETWEEN 7 AND 12;

UPDATE review2
SET Age_category = 'Teenagers'
WHERE AGE BETWEEN 13 AND 19;

UPDATE review2
SET Age_category = 'Young Adults'
WHERE AGE BETWEEN 20 AND 39;

UPDATE review2
SET Age_category = 'Middle-aged Adults'
WHERE AGE BETWEEN 40 AND 59;

UPDATE review2
SET Age_category = 'Elderly'
WHERE AGE >= 60;

-- Memeriksa Kolom tidak NULL
SELECT 
    r1.Age as Age_r1, 
    r2.Age as Age_r2, 
    r1.Age_category as C1_Age, 
    r2.Age_category as C2_Age
FROM (SELECT Age, Age_category FROM review1) as r1
CROSS JOIN (SELECT Age, Age_category FROM review2) as r2
WHERE r1.Age_category IS NULL AND r2.Age_category IS NULL
ORDER BY r1.Age, r2.Age;

ALTER TABLE review1
    MODIFY Age_Category ENUM(
        'Children',
        'Teenagers',
        'Young Adults',
        'Middle-aged Adults',
        'Elderly'
    )NOT NULL AFTER Age;

ALTER TABLE review2
    MODIFY Age_Category ENUM(
        'Children',
        'Teenagers',
        'Young Adults',
        'Middle-aged Adults',
        'Elderly'
    )NOT NULL AFTER Age;

-- 1.Apakah tingkat kepuasan pelanggan lebih tinggi di antara penumpang wanita atau pria?
SELECT r.Gender, r.satisfaction, SUM(r.Frequency) AS `Frq_satisfaction`
FROM (
    SELECT Gender, satisfaction, COUNT(satisfaction) AS Frequency 
    FROM review1
    WHERE satisfaction = 'satisfied' OR satisfaction = 'neutral or dissatisfied'
    GROUP BY Gender, satisfaction

UNION ALL
    
    SELECT Gender, satisfaction, COUNT(satisfaction) AS Frequency 
    FROM review2
    WHERE satisfaction = 'satisfied' OR satisfaction = 'neutral or dissatisfied'
    GROUP BY Gender, satisfaction
) AS r
GROUP BY r.Gender, r.satisfaction
ORDER BY r.`Gender` , Frq_satisfaction ASC;

-- 2.Apakah jenis perjalanan (Personal Travel atau Business Travel) berpengaruh pada tingkat kepuasan pelanggan?
SELECT r.`Type of Travel`, r.satisfaction, SUM(r.Frequency) AS `Frq_satisfaction`
FROM (
    SELECT 
        `Type of Travel`, satisfaction,
        COUNT(satisfaction) AS Frequency
    FROM review1
    WHERE satisfaction = 'satisfied' OR satisfaction = 'neutral or dissatisfied'    
    GROUP BY `Type of Travel` , satisfaction

UNION ALL

    SELECT 
        `Type of Travel`, satisfaction,
        COUNT(satisfaction) AS Frequency
    FROM review2
    WHERE satisfaction = 'satisfied' OR satisfaction = 'neutral or dissatisfied'
    GROUP BY `Type of Travel` , satisfaction
    ) AS r

GROUP BY r.`Type of Travel`, r.satisfaction
ORDER BY r.`Type of Travel`, Frq_satisfaction ASC;

-- 3.Apakah terdapat perbedaan tingkat kepuasan antara kelas penerbangan (Business, Eco, Eco Plus)?
SELECT r.`Class`, r.satisfaction, SUM(r.Frequency) AS `Frq_satisfaction`
FROM(
    SELECT
        `Class`, satisfaction,
        COUNT(satisfaction) AS Frequency
    FROM review1
    GROUP BY `Class`,satisfaction

UNION ALL

    SELECT
        `Class`, satisfaction,
        COUNT(satisfaction) AS Frequency
    FROM review2
    GROUP BY `Class`,satisfaction
) AS r

GROUP BY r.`Class`, r.satisfaction
ORDER BY r.`Class`, Frq_satisfaction ASC;

-- 4.Apakah tingkat kepuasan berbeda di antara pelanggan setia dan tidak setia?
SELECT `r`.`Customer Type`, `r`.satisfaction , SUM(`r`.fr) AS Frq_satisfaction
FROM(
    SELECT 
        `Customer Type`, satisfaction,
        COUNT(satisfaction) AS Fr
    FROM review1
    GROUP BY `Customer Type`, satisfaction

UNION ALL

    SELECT
        `Customer Type`, satisfaction,
        COUNT(satisfaction) AS Fr
    FROM review2
    GROUP BY `Customer Type`, satisfaction
) AS r

GROUP BY `r`.`Customer Type`, `r`.satisfaction
ORDER BY `r`.`Customer Type`, Frq_satisfaction DESC;


/*
    Melanjutkan Analyst lainnya menggunakan Python
*/