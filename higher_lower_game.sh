from random import randint
from art import logo_hl
from art import logo_vs
from game_data import data
b_detail = ''

count = 0

print(logo_hl)

# def get_random_account():
# def call_a(a_detail, a_count, choose_a):
choose_a = randint(0, len(data)-1)
A = data[choose_a]
a_old = f"{A['name']}, {A['description']}, from {A['country']}"
print(f"Compare A: {a_old}")



def call_b(b_detail, count):
    # print(logo_vs)
    choose_b = randint(0, len(data)-1)
    while choose_b == choose_a:
        choose_b = randint(0, len(data)-1)
    B = data[choose_b]
    count =  B['follower_count']
    b_detail =   f"{B['name']}, {B['description']}, from {B['country']}"
    return(b_detail, count)


# compare followers:
score = 0
a_new = ''
wrong_answer = False
while not wrong_answer:
    b_call = call_b(b_detail, count)
    if b_call[0] == a_old:
        b_call = call_b(b_detail, count)
        
    follower_b = b_call[1]
    detail_b = b_call[0]
    print(logo_vs)
    print(f"Against B: {detail_b}")
    Answer = input("Who has more followers? Type 'A' or 'B': ").upper()
    if Answer == "A":
        if A['follower_count'] > follower_b :
            score += 1
            print(f"You are right! Current score is {score}")
            # print(logo_hl)
            print(f"Compare A: {a_old}")
        else:
            print(f"Sorry thats are wrong. Final Score: {score}")
            wrong_answer = True
            
                   
        
    else:
        
        if follower_b  > A['follower_count'] :
            score += 1
            print(f"You are right! Current score is {score}")
            A['follower_count'] = follower_b 
            print(f"Compare A: {detail_b}")
            a_old = detail_b
            # print(logo_hl)
            # print(detail_b)
            # call_b(b_detail, count)
        else:
            print(f"Sorry thats are wrong. Final Score: {score}")
            wrong_answer = True
    
    
    
