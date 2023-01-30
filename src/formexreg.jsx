import React from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import * as Yup from "yup";

const FormVal = Yup.object({
  nombre: Yup.string().required("Necesario"),
  apellido: Yup.string().required("Necesario"),
  direccion: Yup.string().required("Necesario"),
  email: Yup.string().email().required("Necesario"),
  celular: Yup.number().required("Necesario").positive().integer(),
  documento: Yup.string().required("Necesario"),
});

const Formexr = () => (
  <div>
    <Formik
      initialValues={{
        nombre: "",
        apellido: "",
        direccion: "",
        email: "",
        celular: "",
        documento: undefined,
      }}
      validationSchema={FormVal}
      validate={(values) => {
        const errors = {};
        if (!values.email) {
          errors.email = "Necesario";
        } else if (
          !/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.test(values.email)
        ) {
          errors.email = "Correo inválido";
        }
        return errors;
      }}
      onSubmit={(values, { setSubmitting }) => {
        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(values)
        };
        fetch('http://localhost:5000/creartrabajador', requestOptions)
        .then(response => {
          if(response.status === 200){
            return response.json()
          }else{
            alert('Ocurrió un error al crear trabajador')
          }
        })
        .then(data=>{
          alert('Trabajador creado correctamente')
        })
        setSubmitting(false)
      }}
    >
      {({ isSubmitting, setFieldValue }) => (
        <Form>
          Nombre
          <Field name="nombre" />
          <ErrorMessage name="nombre" component="div" />

          Apellido
          <Field name="apellido" />
          <ErrorMessage name="apellido" component="div" />

          Dirección
          <Field name="direccion" />

          Email
          <Field type="email" name="email" />
          <ErrorMessage name="email" component="div" />

          Número de celular
          <Field name="celular" />
          <ErrorMessage name="celular" component="div" />

          Documento de identidad
          <input type="file" name="documento" onChange={(e) => {
              const fileReader = new FileReader();
              fileReader.onload = () => {
                if (fileReader.readyState === 2) {
                  setFieldValue('documento', fileReader.result);
                }
              };
              fileReader.readAsDataURL(e.target.files[0]);
          }} />
          <ErrorMessage name="documento" component="div" />

          <button type="submit" className="btn btn-outline-secondary" disabled={isSubmitting}>
            Registrarme
          </button>
        </Form>
      )}
    </Formik>
  </div>
);

export default Formexr;
