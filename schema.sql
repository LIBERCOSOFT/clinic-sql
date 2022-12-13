-- Create Patients Table
CREATE TABLE patients (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(50) NOT NULL, 
  date_of_bith DATE NOT NULL);

-- Create medical histories table
CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY, 
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT REFERENCES patients(id),
  medical_status VARCHAR NOT NULL);

-- Create invoices table
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY, 
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INT REFERENCES medical_histories(id));