import { Formik, Field, ErrorMessage } from 'formik'


function AppForm() {

    return (
        <Formik initialValues={{ message: "Hola te contacto por..." }}
            validate={values => {
                //console.log(values);
                const errors = {};
                if (!values.name) {
                    errors.name = "Este campo esrequerido";
                } else if (
                    !/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.test(values.email)
                ) {
                    errors.email = "Correo electrónico inválido";
                }

                return errors;
            }}
            onSubmit={
                (values, { setSubmitting }) => {
                    console.log(values);
                    let url = "https://formspree.io/f/xbdwovep";
                    let formData = new FormData();
                    formData.append("name", values.name);
                    formData.append("email", values.email);
                    formData.append("message", values.message);
                    fetch(url, {
                        method: "POST",
                        body: formData,
                        headers: {
                            "Accept": "application/json"
                        }
                    }).then(response => {
                        setSubmitting(false);
                        atert("Gracias por contactarme");
                    })

                }
            }
        >
            {
                ({ isSubmitting, values, handleSubmit }) => (
                    <form onSubmit={handleSubmit}>
                        <div>
                            <label htmlFor="name">Nombre:</label>
                            <Field id="name" type="text" name="name" autoComplete="name"></Field>
                            <ErrorMessage name="name" component="p" />
                        </div>
                        <div>
                            <label htmlFor="email">Correo electrónico:</label>
                            <Field id="email" type="email" name="email" autoComplete="email"></Field>
                            <ErrorMessage name="email" component="p" />
                        </div>
                        <div>
                            <label htmlFor="message">Mensaje:</label>
                            <Field id="message" component="textarea" value={values.message} name="message"
                                autoComplete="off"></Field>
                        </div>
                        <button type="submit" disabled={isSubmitting}>
                            {isSubmitting ? "Enviando..." : "Enviar mensaje"}

                        </button>
                    </form>
                )

            }
        </Formik>
    )
}

export default AppForm