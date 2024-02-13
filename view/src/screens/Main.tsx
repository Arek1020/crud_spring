import React, { useState } from "react";
import { Container } from "@mui/material";
import UserForm from "../UserForm";
import UserTable from "../UserTable";
import config from "../config";
interface User {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
}

const Main: React.FC = () => {
  const [users, setUsers] = useState<User[]>([]);

  const fetchData = async () => {
    try {
      const response = await fetch(`${config.SERVER_URL}/user`);
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      const data = await response.json();
      setUsers(data);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };
  return (
    <div style={{display: 'flex'}}>
      <Container maxWidth="sm">
       <UserForm fetchData={fetchData}/>
      </Container>
      <Container maxWidth="md">
        <div style={{height: 120}}></div>
       <UserTable users={users} fetchData={fetchData}/>
      </Container>
    </div>
  );
};

export default Main;
