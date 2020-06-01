import React, { Component } from "react";
import AdminPage from "./AdminPage";
import StudentPage from "./StudentPage";
import { Row, Col } from "react-bootstrap";

export class LoginForm extends Component {
    constructor() {
        super();
        this.state = {
            value: "",
            isLoggedIn: false,
            isAdmin: false,
        };

        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChange(event) {
        this.setState({ value: event.target.value });
    }

    handleSubmit(event) {
        // alert("A name was submitted: " + this.state.value);
        let value = this.state.value;
        if (value === "admin") {
            this.setState({ isLoggedIn: true, isAdmin: true });
        } else {
            this.setState({ isLoggedIn: true });
        }
        event.preventDefault();
    }

    render() {
        if (this.state.isAdmin) {
            return <AdminPage />;
        } else if (this.state.isLoggedIn) {
            return <StudentPage id={this.state.value} />;
        } else {
            return (
                <Col className="justify-content-md-center">
                    <br />
                    <br />
                    <Row className="justify-content-md-center">
                        <h1>Welcome to Student Management System</h1>
                    </Row>

                    <br />
                    <br />
                    <br />
                    <br />
                    <br />

                    <Row className="justify-content-center">
                        <form onSubmit={this.handleSubmit}>
                            <label>
                                Registration Number:
                                <input
                                    type="text"
                                    value={this.state.value}
                                    onChange={this.handleChange}
                                />
                            </label>
                            <input type="submit" value="Submit" />
                        </form>
                    </Row>
                </Col>
            );
        }
    }
}

export default LoginForm;
