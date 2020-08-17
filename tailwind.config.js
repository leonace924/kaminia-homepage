module.exports = {
  theme: {
    screens: {
      sm: "640px",
      md: "768px",
      lg: "1024px",
      xl: "1276px",
    },
    fontSize: {
      xs: ".75rem",
      sm: ".875rem",
      md: ".9375rem",
      base: "1rem",
      lg: "1.125rem",
      xl: "1.25rem",
      "2xl": "1.375rem",
      "3xl": "1.5rem",
      "4xl": "1.875rem",
      "5xl": "2.25rem",
      "6xl": "3rem",
      "7xl": "4rem",
    },
    // fontFamily: {
    //   display: ["Gilroy", "sans-serif"],
    //   body: ["Graphik", "sans-serif"],
    // },
    backgroundColor: (theme) => ({
      ...theme("colors"),
      secondary: "#f7f7f7",
    }),
    borderColor: (theme) => ({
      ...theme("colors"),
      secondary: "#e7e7e7",
    }),
    borderWidth: {
      default: "1px",
      "0": "0",
      "2": "2px",
      "4": "4px",
    },
    extend: {
      gap: {
        "9": "2.25rem",
      },
      colors: {
        "light-gray": "#686868",
      },
      spacing: {
        "96": "24rem",
        "128": "32rem",
      },
    },
  },
};
