import sys
import numpy as np
from astropy.io import ascii


def read():
    """Read "stars.txt". The output of this function is an astropy Table.
    """
    data = ascii.read("stars.txt", format="commented_header")
    return data


def apparent_magnitude(data):
    """Compute the apparent magnitudes of the stars. Add this column to the table. 
    Print the properties of the star that is the brightest as seen from earth, 
    and the star that is the faintest as seen from earth.
    The output of this function is the updated table.
    """
    data["app_mag"] = np.round(data["abs_magnitude"]+5*np.log10(data["distance"])-5, 2)
    print("\nProperties of the brightest star:\n", data[np.argmin(data["app_mag"])])
    print("\nProperties of the faintest star:\n", data[np.argmax(data["app_mag"])])
    return data


def luminosity(data):
    """Use the absolute magnitude of the stars to compute the luminosity in unit L_sun.
    Add this column to the table. 
    The output of this function is the updated table.
    """
    abs_mag_zon = 4.75    # absolute bolometric magnitude of the sun
    data["luminosity"] = 10 ** (0.4 * (abs_mag_zon - data["abs_magnitude"])) # in [L_sun]
    return data


def mass_lifespan(data):
    """Compute the mass of the brightest and faintest star, and the ratio of lifetime 
    on the main sequence between these stars.
    """
    brightest = data[np.argmin(data["app_mag"])]
    faintest = data[np.argmax(data["app_mag"])]

    # mass
    mass_brightest = (1/1.02) * brightest["luminosity"]**(1/3.92)   # mass in m_sun
    mass_faintest = (1/0.35) * faintest["luminosity"]**(1/2.62)     # mass in m_sun
    print(f"\nMass of the brightest star: {mass_brightest:.2f} [M_sun]")
    print(f"Mass of the faintest star: {mass_faintest:.2f} [M_sun]")

    # lifespan
    lifespan_brightest = mass_brightest**(-2.92)    # msq lifespan compared to the sun
    lifespan_faintest = mass_faintest**(-1.62)      # msq lifespan compared to the sun
    ratio = lifespan_faintest / lifespan_brightest
    print(f"\nMain-sequence lifespans:")
    print(f"The brightest star lives {lifespan_brightest:.5f} times as long as the sun.")
    print(f"The faintest star lives {lifespan_faintest:.2f} times as long as the sun.")
    print(f"De faintest star lives {ratio:.2e} as long as the brightest star before it "
          f"runs out of fuel.")


def main():
    stars = read()
    stars = apparent_magnitude(stars)
    stars = luminosity(stars)
    mass_lifespan(stars)


if __name__ == "__main__":
    sys.exit(main())
