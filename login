// src/pages/Login.js
import { auth, googleProvider } from "../firebase";
import { signInWithPopup, signInWithEmailAndPassword, createUserWithEmailAndPassword } from "firebase/auth";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const loginWithGoogle = async () => {
    await signInWithPopup(auth, googleProvider);
    navigate("/summary");
  };

  const loginWithEmail = async () => {
    await signInWithEmailAndPassword(auth, email, password);
    navigate("/summary");
  };

  const register = async () => {
    await createUserWithEmailAndPassword(auth, email, password);
    navigate("/summary");
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-pink-100">
      <h1 className="text-2xl font-bold mb-4 text-pink-600">เข้าสู่ระบบ</h1>
      
      <button onClick={loginWithGoogle} className="bg-white text-pink-500 px-4 py-2 rounded shadow mb-4">
        เข้าสู่ระบบด้วย Google
      </button>

      <input 
        type="email" placeholder="อีเมล" 
        value={email} onChange={(e)=>setEmail(e.target.value)}
        className="mb-2 p-2 border rounded"
      />
      <input 
        type="password" placeholder="รหัสผ่าน" 
        value={password} onChange={(e)=>setPassword(e.target.value)}
        className="mb-2 p-2 border rounded"
      />
      
      <button onClick={loginWithEmail} className="bg-pink-500 text-white px-4 py-2 rounded mb-2">
        เข้าสู่ระบบ
      </button>
      <button onClick={register} className="text-pink-700 underline">
        สร้างบัญชีใหม่
      </button>
    </div>
  );
}
