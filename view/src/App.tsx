// Importowanie niezbędnych modułów z React i react-router-dom
import React from "react";
import { Routes, Route } from "react-router-dom";
import "@fontsource/roboto/300.css";
import "@fontsource/roboto/400.css";
import "@fontsource/roboto/500.css";
import "@fontsource/roboto/700.css";
import Missing from "./screens/Missing";

import Main from "./screens/Main";

const App: React.FC = () => {
  return (
    <Routes>

      <Route path="/">
        {/* protected */}
        <Route path="/" element={<Main />} />
      </Route>

      <Route path="*" element={<Missing />} />
    </Routes>
  );
};

export default App;
