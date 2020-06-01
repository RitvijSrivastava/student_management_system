import React, { Component } from "react";
import { Container, Row,  Table } from "react-bootstrap";

export class AdminPage extends Component {
    constructor() {
        super();
        this.state = {
            students: [],
        };
    }

    componentDidMount() {
        fetch("/admin")
            .then((res) => res.json())
            .then((students) =>
                this.setState({ students }, () =>
                    console.log("Students fetched...")
                )
            );
    }

    render() {
        return (
            <Container fluid>
                <br />
                <Row className="justify-content-center"><h2>All Students</h2></Row>
                <br />
                <br />
                <Table>
                    <thead>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Middle Name</th>
                        <th>Mobile Number</th>
                        <th>Email Id</th>
                        <th>Section</th>
                        <th>Department</th>
                        <th>Course Name</th>
                        <th>Assignment</th>
                        <th>Address</th>
                    </thead>
                    <tbody>
                        {this.state.students.map((student) => (
                            <tr>
                                <td>{student.first_name}</td>
                                <td>{student.middle_name}</td>
                                <td>{student.last_name}</td>
                                <td>{student.mobile_number}</td>
                                <td>{student.email_id}</td>
                                <td>{student.section}</td>
                                <td>{student.d_name}</td>
                                <td>{student.c_name}</td>
                                <td>{student.a_name}</td>
                                <td>
                                    {student.street_addr},{student.city},
                                    {student.pincode}
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </Table>
            </Container>
        );
    }
}

export default AdminPage;
