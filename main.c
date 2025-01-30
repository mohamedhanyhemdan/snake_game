/*
 * EXTI_prog.c
 *
 *  Created on: Oct 16, 2024
 *      Author: Dell
 */




#include "HAL/LDMX/LDMX_interface.h"
#include "HAL/LCD/LCD_interface.h"
#include "MCAL/EXTI/EXTI_interface.h"
#include "MCAL/NVIC/NVIC_interface.h"
#include "MCAL/RCC/RCC_interface.h"
#include "MCAL/GPIO/GPIO_interface.h"
#include <stdlib.h>  // For rand() and srand()
#include <time.h>    // For time()

void Exti0_fun();
void Exti1_fun();
void Exti2_fun();
void Exti3_fun();

u8 map[8][8] = {0};
u8 ledmrx_array[8] = {0};
u8 win = 1;
u8 fruit_flag = 0;

const u8 game_height = 8;
const u8 game_width = 8;

typedef enum { up, down, right, left } directions;

char upd[] = "UP";
char rtd[] = "Right";
char ltd[] = "Left";
char dnd[] = "Down";

typedef struct {
    s8 elements[30][2];  // Store tail segments [row, col]
    u8 length;           // Current length of the tail
} tail_t;

typedef struct {
    s8 head_row;
    s8 head_col;
    directions dir;
} snake_t;

typedef struct {
    s8 fruit_row;
    s8 fruit_col;
} fruit_t;

snake_t snake = {4, 4, right};
fruit_t fruit;
tail_t tail = { .length = 0 };

// Function to draw the map onto the LED matrix display array
void draw(u8 map[game_height][game_width]) {
    for (s8 col = 0; col < 8; col++) {
        ledmrx_array[col] = 0; // Clear previous column data
        for (s8 row = 7; row >= 0; row--) {
            ledmrx_array[col] = (ledmrx_array[col] << 1) | map[row][col];
        }
    }
}

// Update the snake's head and tail positions based on its direction
void update() {
    // Remove the current head position from the map
    map[snake.head_row][snake.head_col] = 0;

    // Update the head position based on the direction
    if (snake.dir == up) {
        snake.head_row = (snake.head_row == 0) ? 7 : snake.head_row - 1;
    } else if (snake.dir == down) {
        snake.head_row = (snake.head_row == 7) ? 0 : snake.head_row + 1;
    } else if (snake.dir == right) {
        snake.head_col = (snake.head_col == 7) ? 0 : snake.head_col + 1;
    } else if (snake.dir == left) {
        snake.head_col = (snake.head_col == 0) ? 7 : snake.head_col - 1;
    }

    // Check for self-collision with tail
    for (u8 w = 0; w < tail.length; w++) {
        if (snake.head_row == tail.elements[w][0] && snake.head_col == tail.elements[w][1]) {
            win = 0;  // Game over on self-collision
            return;
        }
    }

    // Move the tail segments by shifting them forward
    if (tail.length > 0) {
        for (s8 t = tail.length; t > 0; t--) {
            tail.elements[t][0] = tail.elements[t - 1][0];
            tail.elements[t][1] = tail.elements[t - 1][1];
        }
        // Set the first tail segment to the previous head position
        tail.elements[0][0] = snake.head_row;
        tail.elements[0][1] = snake.head_col;
    }

    // Check if snake eats the fruit
    if (snake.head_row == fruit.fruit_row && snake.head_col == fruit.fruit_col) {
        fruit_flag = 0;  // Fruit consumed
        if (tail.length < 29) tail.length++;  // Increase length up to a limit
    } else {
        // Clear the end of the tail segment on the map if length is exceeded
        if (tail.length > 0) {
            map[tail.elements[tail.length][0]][tail.elements[tail.length][1]] = 0;
        }
    }

    // Update map with new head and tail positions
    map[snake.head_row][snake.head_col] = 1;
    for (u8 t = 0; t < tail.length; t++) {
        map[tail.elements[t][0]][tail.elements[t][1]] = 1;
    }
}

// Generate a new fruit in a random location not occupied by the snake
void generate() {
    if (fruit_flag == 0) {
        do {
            fruit.fruit_row = rand() % 8;
            fruit.fruit_col = rand() % 8;
        } while (map[fruit.fruit_row][fruit.fruit_col] == 1);  // Ensure fruit is not on the snake
        map[fruit.fruit_row][fruit.fruit_col] = 1;
        fruit_flag = 1;  // Fruit placed
    }
}

int main() {
    RCC_voidInitSysClock();
    NVIC_Init();
    NVIC_EnableInterrupt(NVIC_EXTI0);
    NVIC_EnableInterrupt(NVIC_EXTI1);
    NVIC_EnableInterrupt(NVIC_EXTI2);
    NVIC_EnableInterrupt(NVIC_EXTI3);
    RCC_voidEnableClock(RCC_APB2, RCC_GPIOA);
    RCC_voidEnableClock(RCC_APB2, RCC_GPIOB);
    LDMX_voidInit();
    LCD_voidLCDInit();
    LCD_voidGoTo(4,1);
    LCD_voidWriteStrig("Welcome to");
    LCD_voidGoTo(4,2);
    LCD_voidWriteStrig("Snake game");
    for(int j = 0;j< 100000;j++);
    LCD_ClrLCD();
    if(snake.dir == up){
    	LCD_voidGoTo(1, 1);
    	LCD_voidWriteStrig("Direction :");
    	LCD_voidGoTo(12, 1);
    	LCD_voidWriteStrig(upd);
    	LCD_voidGoTo(14, 1);
    	LCD_voidWriteStrig("   ");
    }
    else if(snake.dir == right){
    	LCD_voidGoTo(1, 1);
    	LCD_voidWriteStrig("Direction :");
    	LCD_voidGoTo(12, 1);
    	LCD_voidWriteStrig(rtd);
    	LCD_voidGoTo(16, 1);
    	LCD_voidWriteStrig("");
    }
    else if(snake.dir == left){
    	LCD_voidGoTo(1, 1);
    	LCD_voidWriteStrig("Direction :");
    	LCD_voidGoTo(12, 1);
    	LCD_voidWriteStrig(ltd);
    	LCD_voidGoTo(16, 1);
    	LCD_voidWriteStrig(" ");
    }
    else if(snake.dir == down){
    	LCD_voidGoTo(1, 1);
    	LCD_voidWriteStrig("Direction :");
    	LCD_voidGoTo(12, 1);
    	LCD_voidWriteStrig(dnd);
    	LCD_voidGoTo(16, 1);
    	LCD_voidWriteStrig(" ");
    }

    srand(time(0));  // Seed random number generator

    tail.length = 1; // Initialize tail length to 0 (no tail segments initially)
    map[snake.head_row][snake.head_col] = 1;  // Initialize snake head on the map


        while (win) {
            update();
            draw(map);
            generate();
            LCD_voidGoTo(1, 2);
            LCD_voidWriteStrig("snake tall: ");
            LCD_voidGoTo(13, 2);
            LCD_voidWriteNum(tail.length);
            LCD_voidGoTo(14, 2);
            LCD_voidWriteStrig("   ");
            for (u8 w = 0; w < 15; w++) {
                LDMX_voidDisplay(ledmrx_array);
            }
            EXTI_voidConfigure(EXTI_LINE0, PORTB, EXTI_RISING_EDGE, Exti0_fun);
            EXTI_voidConfigure(EXTI_LINE1, PORTB, EXTI_RISING_EDGE, Exti1_fun);
            EXTI_voidConfigure(EXTI_LINE2, PORTB, EXTI_RISING_EDGE, Exti2_fun);
            EXTI_voidConfigure(EXTI_LINE3, PORTB, EXTI_RISING_EDGE, Exti3_fun);
        }

    LCD_ClrLCD();
    for(int m = 0;m < 50;m++);
    LCD_voidGoTo(7, 1);
    LCD_voidWriteStrig("GAME ");
    LCD_voidGoTo(6, 2);
    LCD_voidWriteStrig("OVER!!!");

    return 0;
}

void Exti0_fun() { if (snake.dir != down){
	snake.dir = up;
	LCD_voidGoTo(1, 1);
	LCD_voidWriteStrig("Direction :");
	LCD_voidGoTo(12, 1);
	LCD_voidWriteStrig(upd);
	LCD_voidGoTo(14, 1);
	LCD_voidWriteStrig("   ");
}
}
void Exti1_fun() { if (snake.dir != left){
	snake.dir = right;
	LCD_voidGoTo(1, 1);
	LCD_voidWriteStrig("Direction :");
	LCD_voidGoTo(12, 1);
	LCD_voidWriteStrig(rtd);
	LCD_voidGoTo(16, 1);
	LCD_voidWriteStrig("");
}
}
void Exti2_fun() { if (snake.dir != right){
	snake.dir = left;
	LCD_voidGoTo(1, 1);
	LCD_voidWriteStrig("Direction :");
	LCD_voidGoTo(12, 1);
	LCD_voidWriteStrig(ltd);
	LCD_voidGoTo(16, 1);
	LCD_voidWriteStrig(" ");
}
}
void Exti3_fun() { if (snake.dir != up){
	snake.dir = down;
	LCD_voidGoTo(1, 1);
	LCD_voidWriteStrig("Direction :");
	LCD_voidGoTo(12, 1);
	LCD_voidWriteStrig(dnd);
	LCD_voidGoTo(16, 1);
	LCD_voidWriteStrig(" ");
}
}
