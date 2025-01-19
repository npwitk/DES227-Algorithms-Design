n = int(input())
requests = []
for i in range(n):
    start, end = input().split()
    requests.append([int(start), int(end)])

requests = sorted(requests, key=lambda x: x[1])

ans = [requests[0]]
for current in requests:
    if current[0] >= ans[-1][1]:
        ans.append(current)

print(len(ans))