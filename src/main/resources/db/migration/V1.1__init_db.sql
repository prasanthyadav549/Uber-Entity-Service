CREATE TABLE booking
(
    id             BIGSERIAL PRIMARY KEY,
    created_at     TIMESTAMP NOT NULL,
    updated_at     TIMESTAMP NOT NULL,
    booking_status TEXT CHECK (booking_status IN ('SCHEDULED', 'CANCELLED', 'CAB_ARRIVED', 'ASSIGNING_DRIVER', 'IN_RIDE', 'COMPLETED')),
start_time     TIMESTAMP NULL,
end_time       TIMESTAMP NULL,
total_distance BIGINT NULL,
driver_id      BIGINT NULL,
passenger_id   BIGINT NULL
);

CREATE TABLE driver
(
    id             BIGSERIAL PRIMARY KEY,
    created_at     TIMESTAMP NOT NULL,
    updated_at     TIMESTAMP NOT NULL,
    name           VARCHAR(255) NULL,
    license_number VARCHAR(255) NOT NULL UNIQUE,
    phone_number   VARCHAR(255) NULL,
    aadhar_card    VARCHAR(255) NULL
);

CREATE TABLE passenger
(
    id           BIGSERIAL PRIMARY KEY,
    created_at   TIMESTAMP NOT NULL,
    updated_at   TIMESTAMP NOT NULL,
    name         VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    email        VARCHAR(255) NOT NULL,
    password     VARCHAR(255) NOT NULL
);

ALTER TABLE booking
ADD CONSTRAINT fk_booking_on_driver FOREIGN KEY (driver_id) REFERENCES driver (id);

ALTER TABLE booking
ADD CONSTRAINT fk_booking_on_passenger FOREIGN KEY (passenger_id) REFERENCES passenger (id);
