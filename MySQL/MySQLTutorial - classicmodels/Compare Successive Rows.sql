CREATE TABLE inventory(
  id INT AUTO_INCREMENT PRIMARY KEY,
  counted_date date NOT NULL,
  item_no VARCHAR(20) NOT NULL,
  qty int(11) NOT NULL
);