import { useState } from "react";
import SearchForm from "./components/form/SearchForm";
import UserProfile from "./components/user/UserProfile";

const App = () => {
  const [userName, setUserName] = useState("quincylarson");

  return (
    <main className="relative min-h-screen overflow-hidden flex flex-col items-center justify-start py-16 px-6 sm:px-10">

      {/* 🌈 خلفية متدرجة متحركة */}
      <div className="absolute inset-0 -z-10 bg-gradient-to-br from-[#0f172a] via-[#1e1b4b] to-[#312e81] animate-gradient" />

      {/* ✨ دوائر مضيئة للزينة */}
      <div className="absolute top-20 left-10 w-72 h-72 bg-indigo-600/30 blur-[120px] rounded-full" />
      <div className="absolute bottom-20 right-10 w-72 h-72 bg-pink-500/30 blur-[120px] rounded-full" />

      {/* 🦸‍♀️ Hero Section */}
      <section className="text-center max-w-3xl mb-12">
        <h1 className="text-4xl sm:text-5xl md:text-6xl font-extrabold leading-tight mb-4 
          bg-gradient-to-r from-indigo-400 via-purple-400 to-pink-400 bg-clip-text text-transparent drop-shadow-[0_2px_10px_rgba(147,51,234,0.3)]">
          GitHub User Explorer
        </h1>

        <p className="text-gray-300 text-lg sm:text-xl leading-relaxed mb-6">
          Search and visualize detailed GitHub user profiles, repositories, and activity — 
          all beautifully displayed with real-time data and modern visuals.
        </p>

        <div className="mt-6">
          <SearchForm userName={userName} setUserName={setUserName} />
        </div>
      </section>

      {/* 👤 User Profile Section */}
      <div className="w-full max-w-5xl">
        <UserProfile userName={userName} />
      </div>

      {/* 💬 Footer */}
      <footer className="mt-16 text-sm text-gray-500 text-center">
        Made with ❤️ by{" "}
        <a
          href="https://github.com/salma-omar"
          target="_blank"
          className="text-pink-400 hover:text-pink-500 transition-all"
        >
          Salma Omar
        </a>
      </footer>
    </main>
  );
};

export default App;
