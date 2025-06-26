# Airbnb_Datamart


# 1. Requirements Specification

## 1.1 Problem Definition and Objective

Airbnb is a global online platform that connects travelers with hosts offering short-term accommodations.
The platform facilitates the entire booking process, including property listing, search and filtering, 
secure payment, and review functionality. To support this, a structured and normalized relational database is required 
that can manage listings, users, bookings, payments, and other associated interactions.

This project aims to develop a conceptual database model that serves as a foundation for a robust data mart. 
The system should capture and relate all essential components of the Airbnb ecosystem while enabling scalability,
accuracy, and efficient query performance.


## 1.2 Roles (User Groups)
Guest: Books accommodations, leaves reviews, manages personal profile, sends messages
Host: Lists accommodations, sets availability and prices, responds to guest inquiries
Administrator: Manages users and listings, reviews complaints, generates platform reports



![image](https://github.com/user-attachments/assets/f185435f-d1fa-418a-9f0e-2dfbaef5bf42)


![image](https://github.com/user-attachments/assets/12288ebe-cf3a-4a12-8e50-72fe8782fc89)


## 1.5 Transition to Data Modeling

The requirements above form the backbone of the system logic. Each identified action and function corresponds directly to an entity, attribute, or relationship in the database. To proceed from abstract functionality to concrete structure, we now translate the business logic into a visual entity-relationship model.

This transition ensures that:

- All data elements are represented

- Relationships (1:1, 1:N, N:M) are normalized

- Each user role's permissions are clearly mapped via access-level logic

- This conceptual model supports later SQL table design and optimization.


# 2. Entity-Relationship Model (ER Model)

This section introduces the core conceptual model, based on standard UML notation and minimal structure required for functional representation. The model reflects real-world relationships and serves as a blueprint for later SQL development.

Key specifications:

- Entities: 25+ entities including User, Guest, Host, Property, Room, Booking, Payment, Voucher, Review, Messages, Amenity, Location, etc.

- Triple Relationships:

     - Booking links Guest, Property, and Date

     - Rating links Guest, Host, and Property

     - Message links Sender, Receiver, and Timestamp

- Cardinality: Clearly marked using UML notation in the ER diagram

- Normalization: Many-to-many relations such as Property-Amenity and Property-Room are normalized using junction tables

- ER Diagram Visual (UML Notation)



![image](https://github.com/user-attachments/assets/f68e3ca0-c1ad-45c9-945e-f64c77801b97)



## 2a. ER Diagram Appendix

The Entity-Relationship diagram presented above captures:

Users: Guests, Hosts, Admins, and their interactions
Properties: With amenities, rooms, categories, and availability
Bookings: Including dates, user associations, chat and payment linkage
Payments and Vouchers: Tied to bookings with detailed transaction info
Messaging: Sender, receiver, timestamped communication
Ratings: Stars and comments from guests linked to properties and hosts
Access Management: Fine-grained control using permission_set, user_group, and access_level
This extended model forms the comprehensive foundation for building an operational Airbnb-like booking system.


