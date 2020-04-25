#include "queue.h"

void
enqueue(queue* q, unsigned char data) {
  if(q->count == QUEUE_SIZE)
    return;

  q->rear = q->rear == QUEUE_SIZE ? 0 : q->rear + 1;
  q->data[q->rear] = data;
  q->count++;

  if(q->front == -1)
    q->front = 0;
}

unsigned char
dequeue(queue* q) {
  if(q->count == 0 || q->front == -1)
    return 0;

  unsigned char data = q->data[q->front];
  q->front++;
  if(q->front == QUEUE_SIZE)
    q->front = 0;
  q->count--;

  if(q->count == 0) {
    q->front = -1;
    q->rear = -1;
  }

  return data;
}