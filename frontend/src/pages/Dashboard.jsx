import React from "react";
import { useNavigate } from "react-router-dom";

const Dashboard = () => {
  const navigate = useNavigate();

  return (
    <div className="flex items-center justify-center h-screen bg-gradient-to-br from-blue-100 to-indigo-200">
      <div className="bg-white p-10 rounded-2xl shadow-xl w-full max-w-md text-center">
        <h1 className="text-4xl font-bold text-orange-600 mb-6">
          Bug Tracker System
        </h1>
        <p className="text-gray-600 mb-8">Track and manage bugs efficiently</p>

        <div className="space-y-4">
          <button
            onClick={() => navigate("/login")}
            className="w-full bg-orange-600 hover:bg-orange-700 text-white py-2 px-4 rounded-xl transition"
          >
            Login
          </button>

          <button
            onClick={() => navigate("/signup")}
            className="w-full border border-orange-600 text-orange-600 hover:bg-indigo-100 py-2 px-4 rounded-xl transition"
          >
            Sign Up
          </button>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
