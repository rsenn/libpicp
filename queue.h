#ifndef QUEUE_H
#define QUEUE_H 1

// Queue
#define QUEUE_SIZE 10
typedef struct {
  int count;
  int rear;
  int front;
  unsigned char data[QUEUE_SIZE];
} queue;

void enqueue(queue*, unsigned char);

unsigned char dequeue(queue*);

#define queue_count(q) ((q)->count)

#endif // QUEUE_H
