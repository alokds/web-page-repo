MENU = {
    "espresso": {
        "ingredients": {
            "water": 50,
            "coffee": 18,
        },
        "cost": 1.5,
    },
    "latte": {
        "ingredients": {
            "water": 200,
            "milk": 150,
            "coffee": 24,
        },
        "cost": 2.5,
    },
    "cappuccino": {
        "ingredients": {
            "water": 250,
            "milk": 100,
            "coffee": 24,
        },
        "cost": 3.0,
    }
}

resources = {
    "water": 300,
    "milk": 200,
    "coffee": 100,
}
money = 0
is_on = True

# TODO Calculate money given

def coins():
    """ Calculate the money given by customer"""
    money = int(input("Please insert coins.\n how many quarters?: ")) * 0.25
    money += int(input("how many dimes?: ")) * 0.1
    money += int(input("how many nickles?: ")) * 0.05
    money += int(input("how many pennies?: ")) * 0.01
    return money


# TODO calculate resources

def remaining_resources(drink):
    """ Calculate remaining resources"""
    for i in drink['ingredients']:
        resources[i] -= drink['ingredients'][i]
    return resources


def current_stock(drink):
    """ Find if the resources are sufficient for choosen drink"""
    for i in drink['ingredients']:
        if resources[i] < drink['ingredients'][i]:
            return False
        return True

# TODO Make coffee


def make_coffee(payment, drink):
    if payment >= drink['cost']:
        global money
        money += round(drink['cost'], 2)
        print(f"Here is ${round(payment - drink['cost'], 2)} in change.")
        print(f"Here is your {user_choice} ☕️. Enjoy!")
        resources = remaining_resources(drink)
        return resources
    else:
        print(f"Sorry coin is not sufficient! Here is your return: {round(payment, 2)}")


while is_on is True:
    user_choice = input(" What would you like? (espresso/latte/cappuccino): ")
    if user_choice == 'off':
        is_on = False
    elif user_choice == 'report':
        print(f"Water:  {resources['water']}ml\nMilk: {resources['milk']}ml\n"
              f"Coffee: {resources['coffee']}g\nMoney: ${money}")

    elif user_choice != 'espresso' and user_choice != 'latte' and user_choice != 'cappuccino':
        print(" Invalid choice; What would you like? (espresso/latte/cappuccino): ")
    else:
        drink = MENU[user_choice]
        if current_stock(drink):
            payment = coins()
            make_coffee(payment, drink)
        else:
            print(f"Sorry There is no  sufficient water!")
