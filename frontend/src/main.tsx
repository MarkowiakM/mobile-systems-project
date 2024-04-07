import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import ProtectedRoute from "@/ProtectedRoute";
import { URLS } from "@/constants/urls";
import Dashboard from "@/pages/Dashboard";
import Error from "@/pages/Error";
import MyProfile from "@/pages/MyProfile";
import UserProfile from "@/pages/UserProfile";
import App from "./App";
import "./index.css";

const router = createBrowserRouter([
  {
    path: "",
    element: <App />,
    errorElement: <Error />,
    children: [
      {
        path: "",
        element: <Dashboard />,
      },
      {
        path: `${URLS.PROFILE}/:id`,
        element: <UserProfile />,
      },
      {
        element: <ProtectedRoute allowedRoles={["user", "admin"]} />,
        children: [
          {
            path: URLS.MY_PROFILE,
            element: <MyProfile />,
          },
        ],
      },
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
);
