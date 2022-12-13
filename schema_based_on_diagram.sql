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

/* Create invoice_items */

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL (8,2),
    quantity INT,
    total_price DECIMAL (8,2),
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY(invoice_id) REFERENCES invoices (id),
    FOREIGN KEY(treatment_id) REFERENCES treatments (id),	
);

/* Create treatments */
CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR,
    name VARCHAR,   	
);

/*Create join table medical_histories and treatments */

CREATE TABLE medical_treatment (
    treatment_id INT,
    med_history_id INT,
    FOREIGN KEY(treatment_id) REFERENCES treatments (id),
    FOREIGN KEY(med_history_id) REFERENCES medical_histories (id),   	
);
