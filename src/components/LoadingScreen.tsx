import { ShoppingCart } from 'lucide-react';

export const LoadingScreen = () => {
  return (
    <div className="fixed inset-0 bg-gradient-to-br from-blue-900 via-blue-800 to-orange-600 flex items-center justify-center z-50">
      <div className="text-center">
        <div className="relative w-64 h-2 bg-white/20 rounded-full overflow-hidden mb-8">
          <div className="absolute inset-0 flex items-center">
            <div className="animate-cart absolute left-0">
              <ShoppingCart className="w-8 h-8 text-white" />
            </div>
          </div>
          <div className="absolute inset-0 bg-gradient-to-r from-orange-500 to-orange-400 rounded-full animate-loading-bar origin-left"></div>
        </div>
        <h2 className="text-white text-2xl font-bold mb-2 animate-pulse">Promotees Group</h2>
        <p className="text-white/80 text-sm">Loading your wholesale gallery...</p>
      </div>
      <style>{`
        @keyframes cart {
          0% { transform: translateX(0); }
          100% { transform: translateX(240px); }
        }
        @keyframes loading-bar {
          0% { transform: scaleX(0); }
          100% { transform: scaleX(1); }
        }
        .animate-cart {
          animation: cart 2s ease-in-out infinite;
        }
        .animate-loading-bar {
          animation: loading-bar 2s ease-in-out infinite;
        }
      `}</style>
    </div>
  );
};
