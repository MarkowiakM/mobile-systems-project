import * as selectors from "./homePageSelectors.ts";

describe("Starting page loads correctly", () => {
  it("Loads page", () => {
    cy.visit("http://localhost:5173/");
  });

  it("Has map", () => {
    cy.visit("http://localhost:5173/");
    cy.get(selectors.map).should("exist");
  });

  it("Has search bar", () => {
    cy.visit("http://localhost:5173/");
    cy.get(selectors.searchbar).should("exist");
  });

  it("Has all dropdowns", () => {
    cy.visit("http://localhost:5173/");
    cy.get(selectors.categoryDropdown).should("exist");
    cy.get(selectors.pricePerDay).should("exist");
    cy.get(selectors.playerCount).should("exist");
    cy.get(selectors.age).should("exist");
  });

  it("Shows all game instances", () => {
    cy.visit("http://localhost:5173/");
    cy.get(selectors.gameInstanceDiv).should("exist").children().should("have.length", 5);
  });

  it("Has sidebar", () => {
    cy.visit("http://localhost:5173/");
    cy.get(selectors.sidebar).should("exist");
    cy.get(selectors.sidebar).children().should("have.length", 2);
  });

  it("Has user button", () => {
    cy.visit("http://localhost:5173/");
    cy.get(selectors.userButton).should("exist");
  });

  it("has user preferences panel", () => {
    cy.visit("http://localhost:5173/");
    cy.get(selectors.userButton).click();
    cy.get(selectors.userPreferencesPanel).should("exist");
    cy.get(selectors.userPreferencesPanel).children().should("have.length", 3);
    cy.getBySel("cokolwiek").should("exist");
  });

  it("can log in", () => {
    cy.loginByGoogleApi();
    cy.get(selectors.userButton).click();
    cy.get(selectors.myProfileButton).should("exist");
    cy.get(selectors.lowerSidebar).children().should("have.length", 3);
  });

  it("Can login and logout", () => {
    cy.loginByGoogleApi();
    cy.get(selectors.userButton).click();
    cy.get(selectors.myProfileButton).should("exist");
    cy.get(selectors.lowerSidebar).children().should("have.length", 3);
    cy.get(selectors.userButton).click();
    cy.get(selectors.logOutButton).click();
    cy.get(selectors.myProfileButton).should("not.exist");
    cy.get(selectors.lowerSidebar).children().should("have.length", 1);
  });
  it("has working searchbar", () => {
    cy.visit("http://localhost:5173/");
    cy.get(selectors.searchbar).type("ThisGameDoesNotExist {enter}");
    cy.get(selectors.gameNotFoundLabel)
      .should("exist")
      .should("contain", "Nie znaleziono żadnych gier");
  });
});
