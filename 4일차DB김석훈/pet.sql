-- 고객
USE mydatabase;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- 반려동물
CREATE TABLE Pet (
    pet_id INT PRIMARY KEY,
    customer_id INT,
    name VARCHAR(100),
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- 객실
CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50),
    price DECIMAL(10, 2)
);

-- 예약
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    pet_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (pet_id) REFERENCES Pet(pet_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

-- 서비스
CREATE TABLE Service (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- 예약-서비스 연결 테이블
CREATE TABLE Reservation_Service (
    reservation_id INT,
    service_id INT,
    PRIMARY KEY (reservation_id, service_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
    FOREIGN KEY (service_id) REFERENCES Service(service_id)
);
