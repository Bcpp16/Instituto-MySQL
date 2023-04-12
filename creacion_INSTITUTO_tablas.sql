create database INSTITUTO;
show databases;

USE INSTITUTO;

CREATE TABLE Personas (
ID_Persona int NOT NULL, 
Documento varchar(50) NOT NULL, 
Nombre varchar(50) NOT NULL, 
Apellido varchar(50) NOT NULL, 
Fec_Nac date NOT NULL, 
Correo varchar(50) NOT NULL, 
Telefono numeric, 
ID_Pais integer, 
PRIMARY KEY (ID_Persona)
);



CREATE TABLE Paises(
ID_Pais int NOT NULL,
Nombre varchar(50) NOT NULL
);


ALTER TABLE Paises
ADD PRIMARY KEY (ID_Pais); 


CREATE TABLE Docentes(
ID_Docente int NOT NULL, 
ID_Persona int NOT NULL, 
Fec_Ingreso date NOT NULL, 
Fec_Egreso date, 
Fec_Registro date NOT NULL, 
PRIMARY KEY (ID_Docente)
);


CREATE TABLE Estudiantes(
ID_Estudiante int NOT NULL, 
ID_Persona int NOT NULL, 
Fec_Primer_Matr date,
Can_Cursos_Final int, 
Fec_Registro date NOT NULL, 
PRIMARY KEY (ID_Estudiante) 
);



CREATE TABLE Materias(
ID_Materia int NOT NULL auto_increment , 
Nombre varchar(50) NOT NULL, 
PRIMARY KEY(ID_Materia)
);


CREATE TABLE Cursos(
ID_Curso int NOT NULL , 
ID_Docente int NOT NULL, 
ID_Materia int NOT NULL,
Fec_Inicio date NOT NULL,
Fec_Fin date, 
Modalidad varchar(50) NOT NULL, 
PRIMARY KEY (ID_Curso)
);


CREATE TABLE Matriculas (
ID_Matricula int NOT NULL, 
ID_Curso int NOT NULL, 
ID_Estudiante int NOT NULL, 
Fec_Matricula date NOT NULL, 
Nota_Final int, 
PRIMARY KEY (ID_Matricula)
);



SHOW TABLES; /*Muestra todas las tablas de la base de datos  */


/*Mostrar las estructuras de las tablas*/
DESCRIBE Matriculas;
DESCRIBE PERSONAS; 
DESCRIBE ESTUDIANTES;
DESCRIBE DOCENTES;
Describe Cursos;


/*CREACION DE CONSTRAINT*/

SELECT * FROM materias;

DROP TABLE MATERIAS;


/*UNIQUE and FOREIGN KEY CONSTRAINT*/

ALTER TABLE Personas ADD UNIQUE (Documento);
ALTER TABLE Personas ADD UNIQUE (Correo);

ALTER TABLE Paises ADD UNIQUE (Nombre);

ALTER TABLE Docentes ADD UNIQUE (ID_Persona);

ALTER TABLE Estudiantes ADD UNIQUE (ID_Persona);

ALTER TABLE Materias ADD UNIQUE (Nombre);

ALTER TABLE Cursos ADD UNIQUE (ID_Docente);
ALTER TABLE Cursos ADD UNIQUE (ID_Materia);
ALTER TABLE Cursos ADD UNIQUE (Fec_Inicio);


ALTER TABLE Matriculas ADD UNIQUE (ID_Curso);
ALTER TABLE Matriculas ADD UNIQUE (ID_Estudiante);
ALTER TABLE Matriculas ADD UNIQUE (Fec_Matricula);


ALTER TABLE Cursos
DROP INDEX ID_DOCENTE; 

ALTER TABLE Personas 
ADD CONSTRAINT FK_PersonaPais
FOREIGN KEY (ID_Pais) REFERENCES Paises(ID_Pais);


ALTER TABLE Docentes 
ADD CONSTRAINT FK_DocentePersona
FOREIGN KEY (ID_Persona) REFERENCES Personas(ID_Persona);


ALTER TABLE Estudiantes
ADD CONSTRAINT FK_EstudiantePersona
FOREIGN KEY (ID_Persona) REFERENCES Personas(ID_Persona);


ALTER TABLE Cursos 
ADD CONSTRAINT FK_CursoDocente
FOREIGN KEY (ID_Docente) REFERENCES Docentes(ID_Docente);


ALTER TABLE Cursos 
ADD CONSTRAINT FK_CursoMateria
FOREIGN KEY (ID_Materia) REFERENCES Materias(ID_Materia);


ALTER TABLE Matriculas 
ADD CONSTRAINT FK_MatriculaCurso
FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID_Curso);

ALTER TABLE Matriculas 
ADD CONSTRAINT FK_MatriculaEstudiante
FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante);



INSERT INTO Materias (Nombre) VALUES ("INTRODUCCION A BASE DE DATOS");
INSERT INTO Materias (Nombre) VALUES ("INTRODUCCION A PROGRAMACION");
INSERT INTO Materias (Nombre) VALUES ("TESTING");
INSERT INTO Materias (Nombre) VALUES ("INFRAESTRUCTURA");

ALTER TABLE Personas MODIFY Telefono varchar(50);
ALTER TABLE Personas MODIFY ID_Pais  INT NULL;





