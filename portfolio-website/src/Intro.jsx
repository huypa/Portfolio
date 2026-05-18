import { motion } from "framer-motion";
import profileImg from "../profile.jpeg";

export default function Intro({ onEnter }) {
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
        initial={{ opacity: 0, scale: 0.8 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ delay: 0.2, duration: 0.5, ease: "easeOut" }}
      >
        <img src={profileImg} alt="Anh Huy Phung" />
      </motion.div>

      <motion.h1
        className="intro-name"
        initial={{ opacity: 0, y: 16 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.6, duration: 0.5, ease: "easeOut" }}
      >
        Anh Huy Phung
      </motion.h1>

      <motion.p
        className="intro-title"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1.0, duration: 0.4 }}
      >
        Data Scientist · Analytics Engineer
      </motion.p>

      <motion.p
        className="intro-location"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1.3, duration: 0.4 }}
      >
        Ho Chi Minh City · Melbourne
      </motion.p>

      <motion.div
        className="intro-divider"
        initial={{ width: 0 }}
        animate={{ width: "100px" }}
        transition={{ delay: 1.7, duration: 0.45, ease: "easeOut" }}
      />

      <motion.p
        className="intro-tagline"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 2.2, duration: 0.6 }}
      >
        "ML pipelines by day. Clean dashboards by night."
      </motion.p>

      <motion.button
        className="intro-btn"
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 3.2, type: "spring", stiffness: 220, damping: 18 }}
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
