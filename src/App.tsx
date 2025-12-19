import { useState, useEffect } from 'react';
import { RouterProvider, useRouter } from './lib/router';
import { Navigation } from './components/Navigation';
import { LoadingScreen } from './components/LoadingScreen';
import { Home } from './pages/Home';
import { Gallery } from './pages/Gallery';
import { CategoryPage } from './pages/CategoryPage';

const AppContent = () => {
  const { currentPath } = useRouter();

  const renderPage = () => {
    if (currentPath === '/') {
      return <Home />;
    } else if (currentPath === '/gallery') {
      return <Gallery />;
    } else if (currentPath.startsWith('/category/')) {
      return <CategoryPage />;
    }
    return <Home />;
  };

  return (
    <div className="min-h-screen">
      <Navigation />
      {renderPage()}
    </div>
  );
};

function App() {
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const timer = setTimeout(() => {
      setIsLoading(false);
    }, 2500);

    return () => clearTimeout(timer);
  }, []);

  if (isLoading) {
    return <LoadingScreen />;
  }

  return (
    <RouterProvider>
      <AppContent />
    </RouterProvider>
  );
}

export default App;
