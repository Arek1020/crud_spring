import React, { useEffect, useState } from "react";
import Paper from "@mui/material/Paper";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import config from "./config";
import { Button, TextField } from "@mui/material";

interface User {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
}

const UserTable: React.FC<any> = ({fetchData, users}) => {
  const [editingUserId, setEditingUserId] = useState<number | null>(null);
  const [editedUser, setEditedUser] = useState<User>({
    id: 0,
    firstName: "",
    lastName: "",
    email: "",
  });

  

  useEffect(() => {
    fetchData();
  }, []);

  const onEdit = (id: number, user: User) => {};

  const onDelete = async (id: number) => {
    const response = await fetch(`${config.SERVER_URL}/user/${id}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
      },
      // body: JSON.stringify(editedUser),
    });

    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    fetchData();

    alert("User deleted successfully!");
  };

  const handleEdit = (id: number, user: User) => {
    setEditingUserId(id);
    setEditedUser(user);
  };

  const handleSave = async () => {
    onEdit(editedUser.id, editedUser);
    const response = await fetch(`${config.SERVER_URL}/user/${editedUser.id}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(editedUser),
    });

    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    fetchData();

    alert("User updated successfully!");
    setEditingUserId(null);
  };

  return (
    <TableContainer component={Paper}>
      <Table
        style={{
          minWidth: 650,
        }}
        aria-label="user table"
      >
        <TableHead>
          <TableRow>
            <TableCell>Imie</TableCell>
            <TableCell>Nazwisko</TableCell>
            <TableCell>Email</TableCell>
            <TableCell>Actions</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {users.map((user: any) => (
            <TableRow key={user.id}>
              <TableCell>
                {editingUserId === user.id ? (
                  <TextField
                    value={editedUser.firstName}
                    onChange={(e) =>
                      setEditedUser({
                        ...editedUser,
                        firstName: e.target.value,
                      })
                    }
                  />
                ) : (
                  user.firstName
                )}
              </TableCell>
              <TableCell>
                {editingUserId === user.id ? (
                  <TextField
                    value={editedUser.lastName}
                    onChange={(e) =>
                      setEditedUser({ ...editedUser, lastName: e.target.value })
                    }
                  />
                ) : (
                  user.lastName
                )}
              </TableCell>
              <TableCell>
                {editingUserId === user.id ? (
                  <TextField
                    value={editedUser.email}
                    onChange={(e) =>
                      setEditedUser({ ...editedUser, email: e.target.value })
                    }
                  />
                ) : (
                  user.email
                )}
              </TableCell>
              <TableCell>
                {editingUserId === user.id ? (
                  <>
                    <Button
                      onClick={() => handleSave()}
                      variant="contained"
                      color="primary"
                    >
                      Save
                    </Button>
                    <Button
                      onClick={() => setEditingUserId(null)}
                      variant="contained"
                      color="secondary"
                    >
                      Cancel
                    </Button>
                  </>
                ) : (
                  <>
                    <Button
                      onClick={() => handleEdit(user.id, user)}
                      variant="contained"
                      color="primary"
                    >
                      Edit
                    </Button>
                    <Button
                      onClick={() => onDelete(user.id)}
                      variant="contained"
                      color="secondary"
                    >
                      Delete
                    </Button>
                  </>
                )}
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default UserTable;
