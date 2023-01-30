import React from 'react';
import { Formik, Form, Field, ErrorMessage } from 'formik';
import * as Yup from 'yup';

const FormVal = Yup.object({
    nombre: Yup.string().required('Necesario'),
    apellido: Yup.string().required('Necesario'),
    direccion: Yup.string().required('Necesario'),
    email: Yup.string().email().required('Necesario'),
    celular: Yup.number().required('Necesario').positive().integer(),
    recibo: Yup.string().required('Necesario'),
    mediopago: Yup.string().required('Necesario')
});

const Formclir = () => (
  <div>
    <Formik
      initialValues={{ nombre: '', apellido: '',direccion:'',email:'',celular:'', recibo:undefined, mediopago:'' }}
      validationSchema = {FormVal}
      validate={values => {
        const errors = {};
        if (!values.email) {
          errors.email = 'Necesario';
        } else if (
          !/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.test(values.email)
        ) {
          errors.email = 'Correo inválido';
        }
        return errors;
      }}
      onSubmit={(values, { setSubmitting }) => {
        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(values)
        };
        fetch('http://localhost:5000/crearusuario', requestOptions)
        .then(response => {
          if(response.status === 200){
            return response.json()
          }else{
            alert('Ocurrió un error al crear usuario')
          }
        })
        .then(data=>{
          alert('Usuario creado correctamente')
        })
        setSubmitting(false)
      }}
    >
      {({ isSubmitting, setFieldValue }) => (
        <Form>
          Nombre
          <Field name="nombre"/>
          <ErrorMessage name="nombre" component="div" />

          Apellido 
          <Field name="apellido"/>
          <ErrorMessage name="apellido" component="div" />

          Dirección 
          <Field name="direccion"/>

          Email
          <Field type="email" name="email" />
          <ErrorMessage name="email" component="div" />

          Número de celular
          <Field name="celular" />
          <ErrorMessage name="celular" component="div" />

          Recibo de servicio público
          <input type="file" name="recibo" onChange={(e) => {
                  const fileReader = new FileReader();
                  fileReader.onload = () => {
                    if (fileReader.readyState === 2) {
                      setFieldValue('recibo', fileReader.result);
                    }
                  };
                  fileReader.readAsDataURL(e.target.files[0]);
          }} />
          <ErrorMessage name="recibo" component="div" />

          Medio de pago 
          <Field name="mediopago"/>
          <ErrorMessage name="mediopago" component="div" />

          Tarjeta débito o crédito
          
          <button type="submit" className="btn btn-outline-secondary" disabled={isSubmitting}>
            Registrarme
          </button>
        </Form>
      )}
    </Formik>
  </div>
);

export default Formclir;