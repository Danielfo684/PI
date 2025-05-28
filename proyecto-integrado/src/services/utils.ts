export const utils = {

    orderByPointsAndId: (players: { id: number, points: number, name: string }[]) => {
        players.sort((a, b) => {
            if ((b.points ?? 0) !== (a.points ?? 0)) {
                return (b.points ?? 0) - (a.points ?? 0);
            }
            return (a.id ?? 0) - (b.id ?? 0);
        })
        return players;
    },

}