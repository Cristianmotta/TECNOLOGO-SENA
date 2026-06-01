import { Formik, Form, Field, ErrorMessage } from "formik";
import { NotesContext } from "../context/NotesContext";
import { useContext } from "react";

function NotesForm(){
    const { add } = useContext(NotesContext);
    return(
        <Formik
            initialValues={{title: '', body: ''}}
            Validete={values => {
                const errors = {};
                if(!values.title){
                    errors.title = 'El título es requerido';
                }else if(values.title.length > 20){
                    errors.title = 'El Mensaje es requerido';
                }
                return errors;
            }}
            onSubmit={
                (values, { setSubmitting }) => {
                    add(values.title,values.massage);
                    setSubmitting(false);
                    values.title = "";
                    values.message = "";
                }
            }
        >
            {
                ({ isSubmitting })=>(
                    <Form className="form">
                        <div>
                            <label htmlFor="title">Título</label>
                            <Field type="text" name="title" />
                            <ErrorMessage name="title" component="p"  />
                        </div>
                        <div>
                            <label htmlFor="message">Qué Quieres guardar</label>
                            <Field name="message" as="textarea" />
                            <ErrorMessage name="message" component="p"  />
                        </div>
                        <button type="submit" disabled={isSubmitting}>
                            {isSubmitting ? 'Guardando tu nota...' : 'Guardar Nota'}
                        </button>
                    </Form>
                )
            }
            
        </Formik>
    )
}

export default NotesForm;