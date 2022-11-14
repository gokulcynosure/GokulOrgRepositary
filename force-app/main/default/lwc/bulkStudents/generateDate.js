export default function generateDate({ amountOfRecords }) {
    return [...Array(amountOfRecords)].map((_, index) => {
        return {
            name: 'Gokul',
            website: 90,
            Tamil: 100,
            English: 67,
            Social: 89,
        };
    });
}