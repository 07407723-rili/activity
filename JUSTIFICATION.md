SectionHeading — Atom. It is a simple StatelessWidget used for displaying section titles such as “Search Products,” “Catalog,” and “Add New Product.” It only handles the text style and does not contain any state or complicated logic.

PrimaryButton — Atom. It is a reusable ElevatedButton with the app's common button style. The action is passed through onPressed, so the button itself does not decide what should happen when it is clicked.

ProductIconBadge — Atom. This widget displays an icon inside a fixed 56×56 rounded container. It does not contain any product-related logic and only focuses on how the icon looks.

PriceTag — Atom. It takes a price and displays it in the required PHP format. The formatting is only for presentation, so it does not contain any business logic.

DeleteIconButton — Atom. It is a simple reusable IconButton for the delete action. It only sends the tap through the onPressed callback and does not actually handle deleting the product.

AppTextFormField — Atom. This is a reusable wrapper for TextFormField. The controller, label, and validator are provided from outside, so the widget itself does not contain a specific validation rule.

CategoryDropdownField — Atom. It is a reusable dropdown field that receives its value, choices, and onChanged callback. It only handles displaying the dropdown and passing the selected value back.

SearchInputField — Atom. This is a simple TextField used for entering a search query. It sends the typed text through onChanged and does not handle the actual filtering.

Molecules (lib/ui/molecules/)

ProductInfo — Molecule. It groups the product name, category, and PriceTag together because these details are normally displayed as one part of the product card. It does not have its own state or business logic.

ProductCardActions — Molecule. It groups the “Add to Cart” button and delete button together. Both actions are passed through callbacks, so this widget only handles the layout of the buttons.

Organisms (lib/ui/organisms/)

SearchSection — Organism. It combines the SectionHeading and SearchInputField into one section. It does not own any important application data and only passes the search input back through a callback.

ProductCard — Organism. It combines the product icon, product information, and card actions into one complete product card. It receives a Product and callbacks from the Page but does not directly access or change the main product list.

ProductCatalogList — Organism. It displays the catalog heading and creates a ProductCard for every product it receives. Its logic is mainly for displaying the list, while the actual product data and filtering are still handled by the Page.

AddProductForm — Organism. This is a StatefulWidget because the form needs to keep track of the fields currently being entered. It validates the form, creates a Product when submitted, and sends it back using onSubmit. The form does not directly add the product to the main catalog, so the Page still controls the actual product data.

Template (lib/ui/templates/)

CatalogScreenTemplate — Template. Its main purpose is to arrange the different sections of the screen inside a Scaffold, SingleChildScrollView, and Column. It receives the sections as widgets instead of knowing what data they contain. It also does not import or directly use the Product model, which keeps it separate from the application's data.

Page (lib/ui/pages/)

CatalogPage — Page. This is where the main application data is handled. It owns the _products list, the search query, and the next product ID. It also filters the products, handles adding products, and shows the SnackBars. It then passes the needed data and callbacks down to the different UI components. This keeps the actual product data and main application logic in one place.

Uncertain / Borderline Classification

The main part I was unsure about was AddProductForm because it has its own state. I still classified it as an Organism because the state is only for the form fields, such as what the user is currently typing. It does not own the actual product catalog. After submitting, the form can be cleared, while the real product list is still controlled by CatalogPage.