#  مشروع [Online Store Analytics] – SQL View & Queries

##  نظرة عامة  
دمج بيانات المبيعات من عدة سنوات في العرض الموحد `Sales_data`، وتنفيذ استعلامات تحليلية مفيدة: مبيعات حسب السنة، أرباح حسب الدولة، فئات وأداء المنتجات، مقارنة بين السنوات، وغير ذلك.

---##  التركيب  
1. تأكد من وجود الجداول `data1`, `data2`, `data3` بنفس بنية الأعمدة.  
2. أنشئ العرض الموحد:

   ```sql
   CREATE VIEW Sales_data AS
     SELECT * FROM data1
     UNION ALL
     SELECT * FROM data2
     UNION ALL
     SELECT * FROM data3;
