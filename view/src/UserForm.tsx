import React from "react";
import { useFormik } from "formik";
import * as Yup from "yup";
import { TextField, Button, Container, Typography, Grid } from "@mui/material";
import config from "./config";

const UserForm: React.FC<any> = ({ fetchData }) => {
  const validationSchema = Yup.object({
    email: Yup.string().email("Invalid email address").required("Required"),
  });

  const formik = useFormik({
    initialValues: {
      email: "",
      firstName: "",
      lastName: "",
    },
    validationSchema,
    onSubmit: async (values) => {
      const response = await fetch(`${config.SERVER_URL}/user`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(values),
      });

      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      fetchData();
      alert("User added successfully!");
    },
  });

  return (
    <Container maxWidth="sm">
      <div style={{ height: 100 }}></div>
      <Typography variant="h4" align="center" gutterBottom>
        Wpisz dane użytkownika
      </Typography>
      <form onSubmit={formik.handleSubmit}>
        <Grid container spacing={2}>
          <Grid item xs={12}>
            <TextField
              label="Imie"
              variant="outlined"
              fullWidth
              required
              name="firstName"
              value={formik.values.firstName}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
              error={
                formik.touched.firstName && Boolean(formik.errors.firstName)
              }
              helperText={formik.touched.firstName && formik.errors.firstName}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              label="Nazwisko"
              variant="outlined"
              fullWidth
              required
              name="lastName"
              value={formik.values.lastName}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
              error={formik.touched.lastName && Boolean(formik.errors.lastName)}
              helperText={formik.touched.lastName && formik.errors.lastName}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              label="Adres e-mail"
              variant="outlined"
              fullWidth
              required
              name="email"
              value={formik.values.email}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
              error={formik.touched.email && Boolean(formik.errors.email)}
              helperText={formik.touched.email && formik.errors.email}
            />
          </Grid>

          <Grid item xs={12}>
            <Button type="submit" variant="contained" color="primary">
              Zapisz
            </Button>
          </Grid>
        </Grid>
      </form>
    </Container>
  );
};

export default UserForm;
