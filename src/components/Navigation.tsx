import { Menu, X, ShoppingBag, Grid3x3, Phone, Mail } from 'lucide-react';
import { useState } from 'react';
import { useRouter } from '../lib/router';

export const Navigation = () => {
  const [isOpen, setIsOpen] = useState(false);
  const { navigate, currentPath } = useRouter();

  const navItems = [
    { path: '/', label: 'Home', icon: ShoppingBag },
    { path: '/gallery', label: 'Gallery', icon: Grid3x3 },
  ];

  return (
    <nav className="fixed top-0 left-0 right-0 z-40 bg-gradient-to-r from-blue-900 to-blue-800 shadow-lg backdrop-blur-sm">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          <div
            className="flex items-center space-x-3 cursor-pointer group"
            onClick={() => navigate('/')}
          >
            <div className="bg-orange-500 p-2 rounded-lg group-hover:bg-orange-600 transition-colors duration-300">
              <ShoppingBag className="w-6 h-6 text-white" />
            </div>
            <div>
              <h1 className="text-white font-bold text-xl">Promotees Group</h1>
              <p className="text-orange-300 text-xs">From Sellers To Sellers</p>
            </div>
          </div>

          <div className="hidden md:flex items-center space-x-8">
            {navItems.map((item) => {
              const Icon = item.icon;
              const isActive = currentPath === item.path;
              return (
                <button
                  key={item.path}
                  onClick={() => navigate(item.path)}
                  className={`flex items-center space-x-2 px-4 py-2 rounded-lg transition-all duration-300 ${
                    isActive
                      ? 'bg-orange-500 text-white'
                      : 'text-white hover:bg-blue-700'
                  }`}
                >
                  <Icon className="w-5 h-5" />
                  <span className="font-medium">{item.label}</span>
                </button>
              );
            })}
            <div className="flex items-center space-x-4 pl-4 border-l border-blue-700">
              <a href="tel:+1234567890" className="text-white hover:text-orange-300 transition-colors">
                <Phone className="w-5 h-5" />
              </a>
              <a href="mailto:info@promoteesgroup.com" className="text-white hover:text-orange-300 transition-colors">
                <Mail className="w-5 h-5" />
              </a>
            </div>
          </div>

          <button
            className="md:hidden text-white"
            onClick={() => setIsOpen(!isOpen)}
          >
            {isOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>
      </div>

      {isOpen && (
        <div className="md:hidden bg-blue-900 border-t border-blue-700">
          <div className="px-2 pt-2 pb-3 space-y-1">
            {navItems.map((item) => {
              const Icon = item.icon;
              const isActive = currentPath === item.path;
              return (
                <button
                  key={item.path}
                  onClick={() => {
                    navigate(item.path);
                    setIsOpen(false);
                  }}
                  className={`w-full flex items-center space-x-2 px-4 py-3 rounded-lg transition-all duration-300 ${
                    isActive
                      ? 'bg-orange-500 text-white'
                      : 'text-white hover:bg-blue-700'
                  }`}
                >
                  <Icon className="w-5 h-5" />
                  <span className="font-medium">{item.label}</span>
                </button>
              );
            })}
          </div>
        </div>
      )}
    </nav>
  );
};
