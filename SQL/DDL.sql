create database delibase ;
use delibase; 
create table Customer(cus_id INT NOT NULL AUTO_INCREMENT , 
region_id INT, first_name varchar(20),last_name varchar(20) , 
address varchar(20), phone_number VARCHAR(10), email_id VARCHAR(20),
primary key(cus_id)); 

create table Orders (order_id INT NOT NULL AUTO_INCREMENT,  cus_id int, 
package_id int , delivery_type_id int , order_date DATE, delivery_price int ,completed bool , package_contents varchar(20), 
primary key (order_id), 
foreign key(cus_id) references Customer(cus_id) );

create table Packages( 
package_id int not null auto_increment,
fragile bool , 
package_contents varchar(20), 
warehouse_id int , 
quantity int ,
primary key (package_id) 
);

create table PackageManager (
  package_id int,
package_contents varchar(20),
foreign key(package_id) references Packages(package_id)
);

create Table Delivery_Type (
  delivery_type_id int,
  delivery_type varchar(20),
  delivery_cost_multiplier int ,
  primary key (delivery_type_id)
);
create Table Routes(
  route_id int not null auto_increment ,
  route_type_id int ,
  vehicle_id int ,
  start_region_id int ,
  end_region_id int ,
  distance_kiloms int ,
  primary key (route_id)
);

create Table Vehicles (
  vehicle_id int not null auto_increment,
  region_id int,
  emp_id int ,
  vehicle_type_id int ,
  last_maintenance_date DATE,
  kiloms_from_last_maint int ,
  primary key (vehicle_id)
);

create Table Ratings (
  order_id int ,
  Ratings int ,
  foreign key (order_id) references Orders(order_id)
);

create table Vehicle_Type (
  vehicle_type_id int ,
  vehicle_type varchar(20),
  primary key(vehicle_type_id) 
  
);
create table employees (
   emp_id int not null auto_increment,
   salary int ,
   region_id int ,
   work_type_id int ,
   first_name varchar(20),
   last_name varchar (20),
   address varchar(60),
   warehouse_id int ,
   cumulative_rating float,
   total_handles int ,
   primary key (emp_id)
);


create Table Warehouses (
  warehouse_id int not null auto_increment,
  region_id int ,
  primary key ( warehouse_id) 
);

create Table Work_type (
  work_type_id int not null auto_increment,
  work_type varchar(20), 
  primary key ( work_type_id) 
);

create Table Route_Type (
route_type_id  int not null auto_increment,
route_type varchar(20),
 primary key (route_type_id) 

);
create Table Region (
  region_id int not null auto_increment, 
  region_name varchar(30),
  primary key  ( region_id) 
);
create Table sub_region (
  sub_region_id int not null auto_increment,
  region_id int ,
  sub_region_name varchar(20),
  primary key (sub_region_id)
);

create Table Active_Orders (
 cus_id int ,
 order_id int ,
 foreign key (cus_id) references Customer(cus_id),
 foreign key (order_id) references Orders(order_id)
);

create Table Order_History (
  cus_id int ,
  order_id int ,
 foreign key (cus_id) references Customer(cus_id),
 foreign key (order_id) references Orders(order_id)
);
create Table Transport_Logistics( 
  cus_id int ,
  order_id int ,
  route_id int ,
   foreign key (cus_id) references Customer(cus_id),
 foreign key (order_id) references Orders(order_id),
 foreign key (route_id) references Routes(route_id)
);
create Table Involved
(
  emp_id int,
  order_id int,
  foreign key (order_id) references Orders(order_id),
  foreign key (emp_id) references employees(emp_id)
);


ALTER TABLE Customer
ADD FOREIGN KEY (region_id) REFERENCES Region(region_id);

ALTER TABLE Vehicles
ADD FOREIGN KEY (region_id) REFERENCES Region(region_id);

ALTER TABLE Warehouses
ADD FOREIGN KEY (region_id) REFERENCES Region(region_id);

ALTER TABLE Orders
ADD FOREIGN KEY (package_id) REFERENCES Packages(package_id);




ALTER TABLE employees
ADD FOREIGN KEY (region_id) REFERENCES Region(region_id);

ALTER TABLE sub_region
ADD FOREIGN KEY (region_id) REFERENCES Region(region_id);

ALTER TABLE Routes
ADD FOREIGN KEY (start_region_id) REFERENCES Region(region_id);

ALTER TABLE Routes
ADD FOREIGN KEY (end_region_id) REFERENCES Region(region_id);

ALTER TABLE Packages
ADD FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id);

ALTER TABLE employees
ADD FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id);

ALTER TABLE Orders
ADD FOREIGN KEY (delivery_type_id) REFERENCES Delivery_Type(delivery_type_id);

ALTER TABLE Vehicles
ADD FOREIGN KEY (vehicle_type_id) REFERENCES Vehicle_Type(vehicle_type_id);

ALTER TABLE Vehicles
ADD FOREIGN KEY (emp_id) REFERENCES employees(emp_id);

ALTER TABLE employees
ADD FOREIGN KEY (work_type_id) REFERENCES Work_type(work_type_id);

ALTER TABLE Routes
ADD FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id);

ALTER TABLE Routes
ADD FOREIGN KEY (route_type_id) REFERENCES Route_Type(route_type_id);

ALTER TABLE Transport_Logistics
ADD FOREIGN KEY (cus_id) REFERENCES Customer(cus_id);

ALTER TABLE Transport_Logistics
ADD FOREIGN KEY (order_id) REFERENCES Orders(order_id);

ALTER TABLE Transport_Logistics
ADD FOREIGN KEY (route_id) REFERENCES Routes(route_id);

show tables; 
