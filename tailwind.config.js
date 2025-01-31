/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      "./*.php",
      "./src/**/*.{html,php,js}",
    ],
    theme: {
      extend: {
        colors: {
            custom_lightGray: '#EEEEEE',
            custom_gray: '#D9D9D9',
            custom_blueUH: '#034ea1',
            custom_glass: 'rgba(0,0,0,0.2)',
        },
        boxShadow: {
          custom_medium: '20px 20px 4px -14px rgba(0,0,0,0.3)', 
        },
        fontFamily: {
          montserrat: ['Montserrat', 'sans-serif'],
          roboto: ['Roboto', 'serif']
        },
      },
    },
    safelist: [
      // Flexbox classes
      'flex', 'inline-flex', 'flex-row', 'flex-col', 'flex-wrap',
      'justify-start', 'justify-center', 'justify-end', 'justify-between', 'justify-around', 'justify-evenly',
      'items-start', 'items-center', 'items-end', 'items-stretch',
      'gap-1', 'gap-2', 'gap-4', 'gap-8',
  
      // Spacing (margin & padding)
      /^m-/, /^p-/,
      /^mt-/, /^mb-/, /^ml-/, /^mr-/,
      /^pt-/, /^pb-/, /^pl-/, /^pr-/,
  
      // Typography
      /^text-(xs|sm|base|lg|xl|2xl|3xl|4xl|5xl|6xl|7xl|8xl|9xl)/,
      /^font-(thin|light|normal|medium|semibold|bold|extrabold|black)/,
      'text-left', 'text-center', 'text-right', 'text-justify',
      /^leading-/, /^tracking-/,
  
      // Colors (background, text, border)
      /^bg-(transparent|black|white|gray|blue|red|green|yellow|purple|pink)-(100|200|300|400|500|600|700|800|900)/,
      /^text-(gray|blue|red|green|yellow|purple|pink)-(100|200|300|400|500|600|700|800|900)/,
      /^border-(gray|blue|red|green|yellow|purple|pink)-(100|200|300|400|500|600|700|800|900)/,
      'border', 'border-2', 'border-4',
  
      // Hover, focus, active states
      /^hover:/, /^focus:/, /^active:/, /^disabled:/,
  
      // Width and height
      /^w-(auto|full|screen|\d+|\d+\/\d+)/,
      /^h-(auto|full|screen|\d+|\d+\/\d+)/,
  
      // Borders and rounding
      'rounded', 'rounded-sm', 'rounded-md', 'rounded-lg', 'rounded-xl', 'rounded-2xl', 'rounded-full',
      'border-t', 'border-b', 'border-l', 'border-r',
  
      // Shadows
      'shadow-sm', 'shadow', 'shadow-md', 'shadow-lg', 'shadow-xl', 'shadow-2xl', 'shadow-none',
  
      // General utilities
      'hidden', 'block', 'inline-block', 'inline', 'grid',
      'absolute', 'relative', 'fixed', 'sticky',
      /^z-/,
      /^overflow-/,
    ],
    plugins: [],
  };
  