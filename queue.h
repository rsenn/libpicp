#ifndef QUEUE_H
#define QUEUE_H

// Queue
#define QUEUE_SIZE 10
typedef struct {
  int count;
  int rear;
  int front;
  unsigned char data[QUEUE_SIZE];
} queue;

void queue_put(queue*, unsigned char);

unsigned char queue_get(queue*);

#define queue_count(q) ((q)->count)

#endif // QUEUE_H