# [Backend] Flixio - Online Cinema Purchasing

## Brand Phylosophy

"Flixio" reflects the essence and purpose of the application, highlighting several key elements:

Flix (Flicks/Flick): Referring to the word "flicks," which is an abbreviation for movies. In this context, "Flixio" emphasizes the primary focus of the application, which is to offer a ticket purchasing experience for watching films online. The word "Flix" also adds a contemporary touch commonly used in film-related applications and platforms.

I/O (Input/Output): The suffix "io" stands for "Input/Output," commonly used in the world of technology and software. Users of "Flixio" can easily input their movie preferences and show schedules, while the application provides them with up-to-date and relevant outputs.

Flexibility: The combination of "Flix" and "I/O" can also imply "Flexibility." The application emphasizes ease and flexibility in purchasing movie tickets online, allowing users to choose films, cinemas, and schedules according to their preferences.

Modernity: The use of the word "Flixio" gives a modern impression and follows current trends in the entertainment and digital industry. This philosophy demonstrates that the application is a cutting-edge solution to meet the needs and desires of the target users, ranging from teenagers to adults.

Overall, the philosophy of "Flixio" represents a modern, flexible, and innovative online movie ticket purchasing application. The name carries a strong appeal as it combines technological elements, entertainment, and user-friendliness, thereby attracting the desired target audience.

## Collection Postman & Database

- Collection Postman [[here](https://documenter.getpostman.com/view/20144301/UVsSN3i8)]
- Database [[here](https://github.com/luthfidiqi/Flixio-Backend/blob/main/flixio.sql)]

## References

- SQL Injection in Node.js [[here](https://www.veracode.com/blog/secure-development/how-prevent-sql-injection-nodejs)]
- Multiple Statement SQL [[here](https://stackoverflow.com/questions/23266854/node-mysql-multiple-statements-in-one-query)]

## Installation

- `npm i express body-parser cors morgan mysql2 helmet xss-clean compression`
- `npm i nodemon -D`

## Package

- `express` [[here](https://www.npmjs.com/package/express)]
- `body-parser` [[here](https://www.npmjs.com/package/body-parser)]
- `cors` [[here](https://www.npmjs.com/package/cors)]
- `morgan` [[here](https://www.npmjs.com/package/morgan)]
- `mysql2` [[here](https://www.npmjs.com/package/mysql2)]
- `helmet` [[here](https://www.npmjs.com/package/helmet)]
- `xss-clean` [[here](https://www.npmjs.com/package/xss-clean)]
- `compression` [[here](https://www.npmjs.com/package/compression)]
- `nodemon` [[here](https://www.npmjs.com/package/nodemon)]

## Modularisasi

- Public = untuk menyimpan file upload / file yang nntinya bsa diakses secara public oleh user
- Src = untuk menyimpan code dari project backend yang dibuat
  - index.js = file root untuk mengkonfigurasi beberapa library/framework untuk nantinya digunakan di dalam project
  - Config = untuk menyimpan konfigurasi
  - Helpers = untuk menyimpan suatu fungsi yang bsa digunakan di file berbeda
  - Routes = untuk menampung semua path route yang ada di dalam module / sebagai route navigation
  - Modules = untuk mengelompokkan suatu fitur di dalam request
    - Routes = menyimpan path dari tiap request / method
    - Controller = Logic / menyimpan data hasil request / mengeluarkan response
    - Model = database
