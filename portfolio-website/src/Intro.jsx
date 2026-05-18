import { useState, useEffect } from "react";
import { motion } from "framer-motion";
import profileImg from "../profile.jpeg";

const FULL_NAME = "Anh Huy Phung";

export default function Intro({ onEnter }) {
  const [displayName, setDisplayName] = useState("");
  const [nameComplete, setNameComplete] = useState(false);

  useEffect(() => {
    const start = setTimeout(() => {
      let i = 0;
      const timer = setInterval(() => {
        setDisplayName(FULL_NAME.slice(0, ++i));
        if (i >= FULL_NAME.length) {
          clearInterval(timer);
          setNameComplete(true);
        }
      }, 110);
      return () => clearInterval(timer);
    }, 700);
    return () => clearTimeout(start);
  }, []);

  const after = (delay) => ({
    initial: { opacity: 0, y: 10 },
    animate: nameComplete ? { opacity: 1, y: 0 } : { opacity: 0, y: 10 },
    transition: { delay, duration: 0.42, ease: "easeOut" },
  });

  return (
    <motion.div
      className="intro-overlay"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0, scale: 0.98 }}
      transition={{ duration: 0.5 }}
    >
      <motion.div
        className="intro-avatar"
        initial={{ opacity: 0, scale: 0.85 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ delay: 0.15, duration: 0.55, ease: "easeOut" }}
      >
        <img src={profileImg} alt="Anh Huy Phung" />
      </motion.div>

      <h1 className="intro-name">
        {displayName}
        {!nameComplete && <span className="intro-cursor">|</span>}
      </h1>

      <motion.p className="intro-title" {...after(0.05)}>
        Data Scientist · Analytics Engineer
      </motion.p>

      <motion.p className="intro-location" {...after(0.22)}>
        Ho Chi Minh City · Melbourne
      </motion.p>

      <motion.div
        className="intro-divider"
        initial={{ width: 0 }}
        animate={nameComplete ? { width: "80px" } : { width: 0 }}
        transition={{ delay: 0.45, duration: 0.4, ease: "easeOut" }}
      />

      <motion.p
        className="intro-tagline"
        initial={{ opacity: 0 }}
        animate={nameComplete ? { opacity: 1 } : { opacity: 0 }}
        transition={{ delay: 0.9, duration: 0.6 }}
      >
        "ML pipelines by day. Clean dashboards by night."
      </motion.p>

      <motion.button
        className="intro-btn"
        initial={{ opacity: 0, y: 10 }}
        animate={nameComplete ? { opacity: 1, y: 0 } : { opacity: 0, y: 10 }}
        transition={{ delay: 2.1, type: "spring", stiffness: 220, damping: 18 }}
        whileHover={{ scale: 1.04, borderColor: "#FFF3C4" }}
        whileTap={{ scale: 0.97 }}
        onClick={onEnter}
      >
        Explore
        <svg width="14" height="14" fill="none" stroke="currentColor" strokeWidth="2" viewBox="0 0 24 24">
          <line x1="5" y1="12" x2="19" y2="12" />
          <polyline points="12 5 19 12 12 19" />
        </svg>
      </motion.button>
    </motion.div>
  );
}
