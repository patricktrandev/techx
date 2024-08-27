## TechX - Ecommerce Online Shopping Store

Welcome to TechX, a sophisticated Ecommerce online shopping platform built to elevate customer shopping experience through the power of modern web technologies. TechX combines the robust backend capabilities of Spring Boot with the dynamic frontend features of Angular, delivering a high-performance, user-friendly, and scalable solution for online retail.

**_Tentative technologies and frameworks_**

- Java Spring Boot
- Spring Security
- Angular
- Redis
- Mysql

### Key features

**_User_**

![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724716689/Capture_stcgmq.png)

**_Role_**

![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724716869/api/Capture1_bg1qvv.png)

**_Product_**

![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724716925/api/Capture2_nsn7qq.png)
**_Order_**

![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724717088/api/Capture3_q54a9h.png)
**_Order Details_**

![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724717098/api/Capture4_iyc7om.png)
**_Category_**

![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724717100/api/Capture5_zfwbgd.png)
**_Coupon_**

![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724717102/api/Capture6_yoagik.png)

**_Database ER Diagram_**

![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724717442/api/Capture7_qjkcyo.png)

### Getting started

1.Get the latest source code 2. Run this command to setup database with docker

`docker-compose -f ./deployment.yaml up`

then starting techx-backend as server.

Swagger Docs API `http://localhost:8081/swagger-ui/index.html`

_For Angular set up, don't forget run `npm i` before run techx-client_

Please provide these property to run Forgot Password feature

`spring.mail.host=smtp.gmail.com`
`spring.mail.port=587`
`spring.mail.username=your_email`
`spring.mail.password=your_app_password`

---

### Screenshots

| User                                                                                           | Administrator                                                                               |
| :--------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------ |
| ![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724719213/api/Capture.8PNG_qwlfms.png) | ![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724719217/api/Capture10_g6yvq7.png) |
| ![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724719215/api/Capture9_hb3lv1.png)     | ![](https://res.cloudinary.com/dctb1eocj/image/upload/v1724719218/api/Capture11_pfj2nl.png) |
