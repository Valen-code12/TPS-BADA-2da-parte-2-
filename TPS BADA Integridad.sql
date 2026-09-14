/* Ejercicios integridad */

CREATE TABLE Oficinas (
    cod_ofic INT NOT NULL,
    descripción VARCHAR(50) NOT NULL,
    CONSTRAINT pk_oficinas PRIMARY KEY (cod_ofic)
);

CREATE TABLE Empleados (
    cod_emp INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    tipo_doc VARCHAR(10) NOT NULL,
    num_doc INT NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    cod_ofic INT NOT NULL,

    CONSTRAINT pk_empleados PRIMARY KEY (cod_emp),

    CONSTRAINT ck_cod_emp CHECK (cod_emp BETWEEN 100 AND 1000),

    CONSTRAINT uk_documento UNIQUE (tipo_doc, num_doc),

    CONSTRAINT ck_categoria CHECK (categoria IN ('Senior', 'Semi Senior', 'Junior')),

    CONSTRAINT fk_emp_oficinas FOREIGN KEY (cod_ofic) REFERENCES Oficinas(cod_ofic)
);